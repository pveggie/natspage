require 'rails_helper'

RSpec.describe CategoryEntry, type: :model do

  it "has a valid factory" do
    expect(build(:category_entry)).to be_valid
  end

  # Lazily loaded to ensure it's only used when it's needed
  let(:category_entry) { build(:category_entry) }

  describe "ActiveRecord associations" do
  # Associations
    it { expect(category_entry).to belong_to(:photo) }
    it { expect(category_entry).to belong_to(:category) }

  # Database columns/indexes
    it { expect(category_entry).to have_db_index(:photo_id) }
    it { expect(category_entry).to have_db_index(:category_id) }
  end
end