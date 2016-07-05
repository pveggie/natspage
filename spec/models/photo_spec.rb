require 'rails_helper'

RSpec.describe Photo, type: :model do

  it "has a valid factory" do
    # Using the shortened version of FactoryGirl syntax.
    # Add:  "config.include FactoryGirl::Syntax::Methods" (no quotes) to your spec_helper.rb
    expect(build(:photo)).to be_valid
  end

#   # Lazily loaded to ensure it's only used when it's needed
#   # RSpec tip: Try to avoid @instance_variables if possible. They're slow.
  let(:test_photo) { build(:photo) }
  let(:valid_local_photo) { build(:photo, image_location: "../app/assets/images/12494716_418040208366540_1333243431293533848_n.jpg") }
  let(:no_photo) { build(:photo, image_location: nil, remote_image_location_url: nil) }
  let(:saved_photo) { create(:photo) }

  describe "ActiveModel validations" do
    it "is invalid without a photo" do
      expect(no_photo).to_not be_valid
    end

    it "is valid with a local photo" do
      expect(valid_local_photo).to be_valid
    end

    it "is valid with no caption" do
      expect(build(:photo, caption_title: nil, caption_description: nil)).to be_valid
    end

    it { expect(test_photo).to validate_presence_of(:categories) }
    it { expect(test_photo).to validate_presence_of(:category_ids) }

    # Inclusion/acceptance of values
    it { expect(test_photo).to validate_length_of(:caption_title).is_at_most(60) }
    it { expect(test_photo).to validate_length_of(:caption_description).is_at_most(300) }
  end

  describe "ActiveRecord associations" do
    # Associations
    it { expect(test_photo).to have_many(:category_entries).dependent(:destroy) }
    it { expect(test_photo).to have_many(:categories).through(:category_entries) }
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
          photo = create(:photo, categories:
                  [Category.new(name: "Stuff"), Category.new(name: "Stuff 2")])
          expect(photo.categories_string).to eq("stuff stuff 2")
        end
      end
    end
  end
end
