require 'rails_helper'

RSpec.describe Photo, type: :model, focus: true do
  after { Photo.destroy_all }
  after(:all) { FileUtils.rm_rf(Dir["#{Rails.root}/public/uploads"]) }

  it "has a valid factory for local uploads" do
    # Using the shortened version of FactoryGirl syntax.
    # Add:  "config.include FactoryGirl::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:local_photo)).to be_valid
  end

  it "has a valid factory for remote uploads" do
    expect(build(:remote_photo)).to be_valid
  end

# #   # Lazily loaded to ensure it's only used when it's needed
# #   # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
  let(:local_photo) { build(:local_photo) }
  let(:remote_photo) { build(:remote_photo) }
  let(:no_photo) { build(:photo) }
  let(:saved_photo) { create(:local_photo) }

  describe "ActiveModel validations" do
    it "is invalid without a photo" do
      expect(no_photo).to_not be_valid
    end

    it "is valid with no caption" do
      expect(build(:local_photo, caption_title: nil, caption_description: nil)).to be_valid
    end

    it { expect(local_photo).to validate_presence_of(:categories) }

    # Inclusion/acceptance of values
    it { expect(local_photo).to validate_length_of(:caption_title).is_at_most(60) }
    it { expect(local_photo).to validate_length_of(:caption_description).is_at_most(300) }
  end

  describe "Cloudinary storage" do
    it "saves an uploaded photo in Cloudinary" do
      public_id = saved_photo.image_location.file.public_id
      expect(Cloudinary::Api.resources_by_ids(public_id)["resources"].count).to eql(1)
    end

    it "tags images with natpage in Cloudinary" do
      public_id = saved_photo.image_location.file.public_id
      last_with_tag = Cloudinary::Api.resources_by_tag("natpage", max_results: 1)["resources"][0]
      expect(last_with_tag["public_id"]).to eq(public_id)
    end


    it "deletes Cloudinary image when image is deleted from database" do
      public_id = saved_photo.image_location.file.public_id
      Photo.last.destroy
      expect(Cloudinary::Api.resources_by_ids(public_id)["resources"].count).to eql(0)
    end
  end

  describe "ActiveRecord associations" do
    # Associations
    it { expect(local_photo).to have_many(:category_entries).dependent(:destroy) }
    it { expect(local_photo).to have_many(:categories).through(:category_entries) }
  end

  describe "callbacks" do
    # http://guides.rubyonrails.org/active_record_callbacks.html
    # https://github.com/beatrichartz/shoulda-callback-matchers/wiki
    it { expect(saved_photo).to callback(:delete_from_cloudinary).after(:destroy) }
  end

  describe "public instance methods" do
    context "#categories_string" do
      it { expect(saved_photo).to respond_to(:categories_string) }
    end

    context "executes methods correctly" do
      context "#categories_string" do
        it "creates a downcased list of categories for the photo" do
          photo = create(:local_photo, categories:
                  [Category.new(name: "Stuff"), Category.new(name: "Stuff 2")])
          expect(photo.categories_string).to eq("stuff stuff 2")
        end
      end
    end
  end
end
