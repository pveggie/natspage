require 'rails_helper'

RSpec.describe "photos/index", type: :view, focus:true do

  before(:each) do
    assign(:categories, [
      build(:category, name: "Concerts")
    ])
    assign(:photos, [
      build(:remote_photo, caption_title: "Test One", categories: [build(:category, name: "Concerts")]),
      build(:remote_photo, caption_title: "Test Two", categories: [build(:category, name: "Concerts")])
    ])
  end

  after(:each) do
    Photo.destroy_all
  end

  describe "Listing" do
    it "renders a list of photos" do
      render
      expect(render).to match /(Test One)|(Test Two)/
    end
  end

  describe "Button rendering" do
    context "when no admin user is logged in" do
      it "does not render an edit button" do
        render
        expect(rendered).to_not have_css('.edit-button')
      end

      it "does not render a delete button" do
        render
        expect(rendered).to_not have_css('.delete-button')
      end
    end

    context "when an admin user is logged in" do
      # alternative to creating admin user and signing in is to
      # stub out the admin_user method
      let(:admin) { create(:admin) }

      it "renders an edit button" do
        # allow(view).to receive(:admin_user).and_return(true)
        sign_in(admin)
        render
        expect(rendered).to have_css('.edit-button')
      end

      it "renders a delete button" do
        # allow(view).to receive(:admin_user).and_return(true)
        sign_in(admin)
        render
        expect(rendered).to have_css('.delete-button')
      end
    end
  end
end
