require 'rails_helper'

RSpec.describe "pages/about", type: :view, focus: true do
  before(:each) do
    assign(:about_sections,
           [
             build(:about_section, content: "I am a message.")
           ])
  end

  let(:admin) { create(:admin) }

  describe "Standard view" do
    it "renders the about sections" do
      render
      expect(render).to match(/I am a message/)
    end
  end

  describe "Button rendering" do
    before do
      assign(:about_sections, [create(:about_section)])
    end

    context "when no admin user is logged in" do
      it "does not form unhide buttons" do
        render
        expect(rendered).to_not have_css('.btn-unhide-form')
      end
    end

    context "when admin user is logged in" do
      it "renders form unhide buttons" do
        sign_in(admin)

        render
        expect(rendered).to have_css('.btn-unhide-form')
      end
    end
  end
end
