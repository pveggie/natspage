require 'rails_helper'

RSpec.describe CategoryEntry, type: :model, focus:true do
  after { Photo.destroy_all }
  it "has a valid factory" do
    expect(build(:category_entry)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:category_entry) { build(:category_entry, photo_id: 1, category_id: 1) }

  describe "ActiveRecord associations" do
  # Associations
    it { expect(category_entry).to belong_to(:photo) }
    it { expect(category_entry).to belong_to(:category) }

  # Database columns/indexes
    it { expect(category_entry).to have_db_index(:photo_id) }
    it { expect(category_entry).to have_db_index(:category_id) }
  end
end
