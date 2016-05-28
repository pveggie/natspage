class Photo < ActiveRecord::Base
  mount_uploader :image_location, ImageUploader

  has_many :category_entries, dependent: :destroy
  has_many :categories, through: :category_entries

  validates :image_location, presence: true

  after_destroy :delete_from_cloudinary

  # used to add relevant css classes to each photo
  def categories_string
    self.categories.pluck(:name).join(" ").downcase
  end

  private
  def delete_from_cloudinary
    public_id = self.image_location.file.public_id
    Cloudinary::Uploader.destroy(public_id)
  end
end
