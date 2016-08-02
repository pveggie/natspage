require 'rails_helper'

RSpec.describe About, type: :model do
  it "has a valid factory" do
    expect(build(:about)).to be_valid
  end
end
