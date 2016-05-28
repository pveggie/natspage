class PhotosController < ApplicationController

  #normal user can only see photos. adding, editing and destroying photos
  #is done in admin view
  def index
    @photos = Photo.all
  end

  def show
    @photo.Photo.find(params[:id])
  end
end
