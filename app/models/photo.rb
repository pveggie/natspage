class Photo < ActiveRecord::Base
  mount_uploader :image_location, ImageUploader

  has_many :category_entries
  has_many :categories, through: :category_entries

  scope :front_page, -> { where(front_page: true) }
end
