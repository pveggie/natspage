# This is for updating the admin editable text in the about page (pages/about)
# Displaying the about text is handled by the pages controller
class Pages::AboutSectionsController < ApplicationController
  before_action :confirm_admin
  before_action :find_about_section, only: [:update]

  def update
    @about_section.update(about_section_params)
    if @about_section.save
      redirect_to pages_about_path
    else
      render 'pages/about'
    end
  end

  private

  def find_about_section
    @about_section = Pages::AboutSection.find(params[:id])
  end

  def about_section_params
    params.require(:about_section).permit(:header, :content)
  end

  def confirm_admin
    redirect_to pages_about_path unless admin_user?
  end
end
