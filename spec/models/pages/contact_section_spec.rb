require 'rails_helper'

RSpec.describe Pages::ContactSection, type: :model do
  it "has a valid factory" do
    expect(build(:contact_section)).to be_valid
  end

  let(:contact_section) { build(:contact_section) }

  # validations
  describe "Email validation" do
    it { expect(contact_section).to callback(:clean_data).before(:validation) }

    context "for invalid addresses" do
      it { expect(contact_section).to_not allow_value("a")
        .for(:email) }
      it { expect(contact_section).to_not allow_value("www.google.com")
        .for(:email) }
      it { expect(contact_section).to_not allow_value("&:/@example.com")
        .for(:email) }
    end

    context "for valid addresses" do
      it { expect(contact_section).to allow_value("me@gmail.com")
        .for(:email) }
      it { expect(contact_section).to allow_value("blahblah@hotmail.com")
        .for(:email) }
      it { expect(contact_section).to allow_value("AGIOJ14ljg@aljgajlaj.meh")
        .for(:email) }
    end
  end

  describe "Instance methods" do
    it "#clean_data gets downcases attributes" do
      contact_section = build(:contact_section, email: "ABC@something.com")
      p contact_section.clean_data
      expect(contact_section.clean_data[:email]).to eq("abc@something.com")
    end
  end
end
