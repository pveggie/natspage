require 'rails_helper'
# PagesController only deals with displaying information. Update methods
# are in controllers/pages/about_sections
RSpec.describe PagesController, type: :controller do
  let(:admin) { create(:admin) }

  describe "AboutPage" do
    let(:about) { create(:about_section) }

    # starting with single content box, but potentially could have multiple
    # will therefore use index
    describe "GET #about" do
      it "assigns all about sections as @about_sections" do
        get :about
        expect(assigns(:about_sections)).to eq([about])
      end
    end
  end

  describe "ContactPage" do
    let(:contact) { create(:contact_section) }

    describe "GET #contact" do
      it "assigns all contact sections as @contact_sections" do
        get :contact
        expect(assigns(:contact_sections)).to eq(([contact]))
      end
    end
  end
end
