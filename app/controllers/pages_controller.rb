# Gets admin editable text for display in the about and contact pages
# Editing methods are handled by separate controllers in the pages
# folder
class PagesController < ApplicationController
  def about
    @about_sections = Pages::AboutSection.all
  end

  def contact
    @contact_sections = Pages::ContactSection.all
  end
end
