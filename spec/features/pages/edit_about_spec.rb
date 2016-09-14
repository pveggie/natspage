require 'rails_helper'

RSpec.feature "Admin editable about page", :type => :feature, focus: true, js: true do
  feature "Editing about section" do
    background do
      admin = create(:admin)
      create(:about_section, header: "About Me", content: "I am a message.")
      sign_in(admin)
    end

    scenario "admin user can edit the about text" do
      # go to about page and see about section text
      visit('/pages/about')
      expect(page).to have_content("About Me")
      expect(page).to have_content("I am a message")

      # find unhide button for about section and click to load form
      expect(page).to_not have_css('form')
      find('.btn-unhide-form').click
      expect(page).to have_css("form")

      # fill in form
      within('form') do
        fill_in 'Header', with: "I'm a new header"
        fill_in 'Content', with: "I'm new text"
        click_button('Update about section')
      end

      # see updated text on page
      expect(page).to_not have_content("About Me")
      expect(page).to_not have_content("I am a message")

      expect(page).to have_content("I'm a new header")
      expect(page).to have_content("I'm new text")
    end
  end
end

