require 'rails_helper'

RSpec.describe "pages/contact", type: :view, focus: true do
  before(:each) do
    assign(:contact_sections,
           [
             build(:contact_section, email: "mail@something.com")
           ])
  end

  let(:admin) { create(:admin) }

  describe "Standard view" do
    it "renders the contact sections" do
      render
      expect(render).to match(/mail@something.com/)
    end

    # SOCIAL MEDIA ICONS
    context "with corresponding social media urls" do
      it "renders the facebook_icon" do
        render
        expect(render).to have_css('.fa-facebook-square')
      end

      it "renders the twitter icon" do
        render
        expect(render).to have_css('.fa-twitter-square')
      end

      it "renders the flickr icon" do
        render
        expect(render).to have_css('.fa-flickr')
      end

      it "renders the instagram icon" do
        render
        expect(render).to have_css('.fa-instagram')
      end
    end

    context "without corresponding social media urls" do
      it "does not render the facebook icon" do
        assign(:contact_sections, [build(:contact_section, facebook_url: nil)])
        expect(render).to_not have_css('.fa-facebook-square')
      end

      it "does not render the twitter icon" do
        assign(:contact_sections, [build(:contact_section, twitter_url: nil)])
        expect(render).to_not have_css('.fa-twitter-square')
      end

      it "does not render the flickr icon" do
        assign(:contact_sections, [build(:contact_section, flickr_url: nil)])
        expect(render).to_not have_css('.fa-flickr')
      end

      it "does not render the instagram icon" do
        assign(:contact_sections, [build(:contact_section, instagram_url: nil)])
        expect(render).to_not have_css('.fa-instagram')
      end
    end
  end

  describe "Admin buttons" do
    before do
      assign(:contact_sections, [create(:contact_section)])
    end

    context "when no admin user is logged in" do
      it "does not render edit button" do
        render
        expect(rendered).to_not have_css('.edit-button')
      end
    end

    context "when admin user is logged in" do
      it "renders edit button" do
        sign_in(admin)

        render
        expect(rendered).to have_css('.edit-button')
      end
    end

  end

  # describe "Button rendering" do
  #   context "when no admin user is logged in" do
  #     it "does not render edit buttons" do
  #       render
  #       expect(rendered).to_not have_css('.edit-button')
  #     end
  #   end

  #   context "when admin user is logged in" do
  #     it "renders edit buttons" do
  #       assign(:about_sections, [create(:about_section)])
  #       sign_in(admin)

  #       render
  #       expect(rendered).to have_css('.edit-button')
  #     end
  #   end
  # end
end
