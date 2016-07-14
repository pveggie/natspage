require 'rails_helper'

RSpec.feature "Create photos", :type => :feature do
  let(:valid_attributes) { attributes_for(:local_photo) }
  scenario "User is not logged in" do
  end

  scenario "User is not admin" do
  end

  scenario "User is logged in and admin" do
    visit "/"

    # click_button()
  end
end
