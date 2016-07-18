require 'rails_helper'

RSpec.feature "Create photos", :type => :feature, focus: true do
  feature "Adding Photos" do
    background do
      admin = create(:admin)
      create(:category, name: "Concerts")
      sign_in(admin)
    end
    after { Photo.destroy_all }

    scenario "admin user can add a photo and then see it in the gallery" do
      # go to index and click Add Photo
      visit('/')
      click_link("Add Photo")

      # add information to form and click to confirm
      expect(page).to have_css("form")
      within('form') do
        fill_in "Caption title", with: "Rammstein"
        fill_in "Caption description", with: "Performance at Jahrhunderthalle 2016"
        attach_file("Image", File.join(Rails.root, "spec/assets/test_image.jpg"))
        # save_and_open_page
        # category = create(:category, name: "Concerts")
        select("Concerts", from: "Categories")
        click_button("Create Photo")
      end

      # be returned to index and see image
      expect(page).to_not have_css("form")

      within(:css, ".gallery") do
        expect(page).to have_content("Performance at Jahrhunderthalle 2016")
        expect(page).to have_css(".photo-holder")

        # requires js to be true
        expect(page).to have_css("img")
      end
    end
  end
end
