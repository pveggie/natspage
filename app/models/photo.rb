class Photo < ActiveRecord::Base
  mount_uploader :image_location, ImageUploader

  scope :front_page, -> { where(front_page: true) }
end
