class Photo < ActiveRecord::Base
  mount_uploader :image_location, ImageUploader

  has_many :category_entries
  has_many :categories, through: :category_entries

  # used to add relevant css classes to each photo
  def categories_string
    self.categories.pluck(:name).join(" ").downcase
  end
end
