class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.image_alt = @photo.caption_title
    if @photo.save
      redirect_to photos_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def photo_params
    params.require(:photo).permit(:image_location,
                                  :image_location_cache,
                                  :caption_title,
                                  :caption_description,
                                  :category,
                                  :front_page)
  end
end
