class PagesController < ApplicationController
  def about
    @about_sections = Pages::AboutSection.all
  end
end
