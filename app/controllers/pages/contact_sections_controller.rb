# This is for updating the admin editable text in the contact page:
# (pages/contact)
# Displaying the about text is handled by the pages controller
class Pages::ContactSectionsController < ApplicationController
  before_action :confirm_admin
  before_action :find_contact_section, only: [:update]

  def update
    @contact_section.update(contact_section_params)
    if @contact_section.save
      redirect_to pages_contact_path
    else
      render 'pages/contact'
    end
  end

  private

  def find_contact_section
    @contact_section = Pages::ContactSection.find(params[:id])
  end

  def contact_section_params
    params.require(:contact_section)
          .permit(:email,
                  :facebook_url,
                  :twitter_url,
                  :instagram_url,
                  :flickr_url)
  end

  def confirm_admin
    redirect_to pages_contact_path unless admin_user?
  end
end
