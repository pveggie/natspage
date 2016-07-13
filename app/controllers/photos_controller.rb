class PhotosController < ApplicationController
  #normal user can only see photos. adding, editing and destroying photos
  #is done in admin view
  before_action :find_photo, only: [:edit, :update, :destroy]

  def index
    @photos = Photo.all
    @categories = Category.all
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :new
    end
  end

  def update
    @photo.update(photo_params)
    if @photo.save
      redirect_to photos_path
    else
      render :edit
    end
  end

  def destroy
    @photo.delete
    redirect_to photos_path
  end


  private
  # def find_photo
  #   @photo = Photo.find(params[:id])
  # end
  #
  def photo_params
    params.require(:photo).permit(:caption_title, :caption_description,
                                  :image_location, :image_location_cache,
                                  :remote_image_location_url,
                                  :category_ids => [])
  end
end
