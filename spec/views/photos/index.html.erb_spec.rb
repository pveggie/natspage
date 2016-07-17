require 'rails_helper'

RSpec.describe "photos/index", type: :view do

  before(:all) do
      assign(:categories, [
        create(:category)
      ])
      assign(:photos, [
        create(:remote_photo, categories: [Category.first]),
        create(:remote_photo, categories: [Category.first])
      ])
      @user = assign(:user, create(:admin))
    end

    after(:all) do
      Photo.destroy_all
    end


  describe "Listing" do

    it "renders a list of photos" do
      render
    end
  end

  describe "Button rendering" do
    context "when no admin user is logged in" do
      it "does not render an edit button" do
        render
        within('.gallery') do
          expect(rendered).to_not have_css('.edit-button')
        end
      end

      it "does not render a delete button" do
        render
        within('.gallyer') do
          expect(rendered).to_not have_css('.delete-button')
        end
      end
    end

    context "when an admin user is logged in" do
      before(:all) do
        login_as(@user, :scope => :user)
      end

      after(:all) do
        logout(:user)
      end

      it "renders an edit button" do
        render
        within('.gallery') do
          expect(rendered).to have_css('.edit-button')
        end
      end

      it "renders a delete button" do
        render
        within('.gallery') do
          expect(rendered).to have_css('.delete-button')
        end
      end
    end
  end
end
