class PagesController < ApplicationController
  def about
    @about_sections = AboutSection.all
  end
end
