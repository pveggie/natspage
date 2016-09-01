require 'rails_helper'

RSpec.feature "Editable contact page", type: :feature, js: true do
  background do
    admin = create(:admin)
    create( :contact_section,
            email: "email@me.com",
            facebook_url: "https://www.facebook.com/metallica",
            twitter_url: "https://twitter.com/bioware",
            flickr_url: "https://www.flickr.com/photos/natlunt82",
            instagram_url: "https://www.instagram.com/metallica/"
          )
    sign_in(admin)
  end

  scenario "admin can edit contact details" do
    # go to page and see contact data
    visit('pages/contact')
    expect(page).to have_content("email@me.com")

    # find edit button for contact section and click to load modal
    expect(page).to_not have_css('form')
    find('.edit-button').click
    expect(page).to have_css('form')

    # fill in form
    within('form') do
      fill_in 'Email', with: "newemail@email.com"
      fill_in 'Facebook URL', with: "www.facebook.com/bioware"
      fill_in 'Twitter URL', with: "www.twitter.com/metallica"
      fill_in 'Flickr URL', with: "www.flickr.com/photos/natlunt82"
      fill_in 'Instagram URL', with: ""
      click_button("Save changes")
    end

    # see updated email text on page
    expect(page).to_not have_content("email@me.com")
    expect(page).to have_content("newemail@email.com")

    # links for Facebook, Twiiter and Flickr should be updated
    expect(page).to have_selector('a[href="www.facebook.com/bioware"][target="_blank"]')
    expect(page).to have_selector('a[href="www.twitter.com/metallica"][target="_blank"]')
    expect(page).to have_selector('a[href="www.flickr.com/photos/natlunt82"][target="_blank"]')

    # icon for Instagram should not exist (blank address)
    expect(page).to_not have_css('.fa-instagram')
  end
end
