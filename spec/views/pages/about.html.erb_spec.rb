require 'rails_helper'

RSpec.describe "pages/about", type: :view, focus: true do

  before(:each) do
    assign(:about_sections, [
      build(:about_section, header: "About me", content: "I am a message.")
      ])
  end

  let(:admin) { create(:admin) }

  describe "Standard view" do
    it "renders the about sections" do
      render
      expect(render).to match /I am a message/
    end
  end

  describe "Button rendering" do
    context "when no admin user is logged in" do
      it "does not render edit buttons" do
        render
        expect(rendered).to_not have_css('.edit-button')
      end
    end

    context "when admin user is logged in" do
      it "renders edit buttons" do
        sign_in(admin)
        render
        expect(rendered).to have_css('.edit-button')
      end
    end
  end
end
