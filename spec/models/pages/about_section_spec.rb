require 'rails_helper'

RSpec.describe Pages::AboutSection, type: :model do
  it "has a valid factory" do
    expect(build(:about_section)).to be_valid
  end

  let(:about_section) { build(:about_section) }

  it { expect(about_section).to validate_presence_of(:content) }
  it { expect(about_section).to validate_presence_of(:header) }
  it { expect(about_section).to validate_length_of(:header).is_at_most(30) }
end
