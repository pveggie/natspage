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
      it { expect(contact_section).to allow_value("blahblah@hotmail.co.uk")
        .for(:email) }
      it { expect(contact_section).to allow_value("AGIOJ14ljg@aljgajlaj.meh")
        .for(:email) }
    end
  end

  describe "Social media link validation" do
    context "for invalid addresses" do
      it { expect(contact_section).to_not allow_value("something")
        .for(:facebook_url) }
      it { expect(contact_section).to_not allow_value("www.twitter.com/")
        .for(:twitter_url) }
      it { expect(contact_section).to_not allow_value("&:/@instagram.com/weird_characters")
        .for(:instagram_url) }
      it { expect(contact_section).to_not allow_value("www.facebook.com/wrongplatform")
        .for(:flickr_url) }
      it { expect(contact_section).to_not allow_value("www.facebook.com/url with spaces")
        .for(:facebook_url) }
    end

    context "for valid addresses" do
      it { expect(contact_section).to allow_value("facebook.com/my_name")
        .for(:facebook_url) }
      it { expect(contact_section).to allow_value("https://flickr.com/i-am-me33")
        .for(:flickr_url) }
      it { expect(contact_section).to allow_value("www.instagram.co.uk/someone")
        .for(:instagram_url) }
      it { expect(contact_section).to allow_value("http://www.twitter.com/person.of_some-sort")
        .for(:twitter_url) }
    end

  end

  describe "Instance methods" do
    it "#clean_data downcases attribute values" do
      contact_section = build(:contact_section, email: "ABC@something.com")

      expect(cleaned_data(contact_section)[:email])
        .to eq("abc@something.com")
    end

    it "#clean_data strips white space from attribute values" do
      contact_section = build(
        :contact_section,
        twitter_url: "  www.twitter.com/myname    "
      )

      expect(cleaned_data(contact_section)[:twitter_url])
        .to eq("www.twitter.com/myname")
    end
  end

  def cleaned_data(data)
    data.instance_eval { clean_data }
  end
end
