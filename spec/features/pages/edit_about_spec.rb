require 'rails_helper'

RSpec.feature "Edit about", :type => :feature, focus: true, js: true do
  feature "Editing about" do
    background do
      admin = create(:admin)
      create(:about_section, header: "About Me", content: "I am a message.")
      sign_in(admin)
    end

    scenario "admin user can edit the about text" do
      # go to index and click Add Photo
      visit('/pages/about')

      # find edit button for about section
      find('.edit-button').click
      expect(page).to have_css("form")
      # within('form') do
      #   fill_in "Caption title", with: "Rammstein"
      #   fill_in "Caption description", with: "Performance at Jahrhunderthalle 2016"
      #   attach_file("Image", File.join(Rails.root, "spec/assets/test_image.jpg"))
      #   # save_and_open_page
      #   # category = create(:category, name: "Concerts")
      #   select("Concerts", from: "Categories")
      #   click_button("Create Photo")
      # end

      # # be returned to index and see image
      # expect(page).to_not have_css("form")

      # within(:css, ".gallery") do
      #   expect(page).to have_content("Performance at Jahrhunderthalle 2016")
      #   expect(page).to have_css(".photo-holder")

      #   # requires js to be true
      #   expect(page).to have_css("img")
      # end
    end
  end
end

