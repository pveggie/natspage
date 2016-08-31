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
