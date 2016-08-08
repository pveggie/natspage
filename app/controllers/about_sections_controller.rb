class AboutSectionsController < ApplicationController
  before_action :find_about_section, only: [:update]

  def update
    @about_section = AboutSection.find(params[:id])
  end

  private

  def find_about_section
    @about_section = AboutSection.find(params[:id])
  end
end
