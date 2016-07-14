class Photo < ActiveRecord::Base
# == Constants ============================================================

# == Attributes ===========================================================

# == Extensions ===========================================================
  mount_uploader :image_location, ImageUploader
  acts_as_list top_of_list: 0
# == Relationships ========================================================
  has_many :category_entries, dependent: :destroy
  has_many :categories, through: :category_entries
# == Validations ==========================================================
  validate  :has_image
  # validates :categories, :category_ids, presence: true
  # validates :categories, presence: true
  validates :caption_title, length: { maximum: 60 }
  validates :caption_description, length: { maximum: 300 }
# == Scopes ===============================================================

# == Callbacks ============================================================
  after_destroy :delete_from_cloudinary
# == Class Methods ========================================================

# == Instance Methods =====================================================
  # used to add relevant css classes to each photo
  def categories_string
    self.categories.pluck(:name).join(" ").downcase
  end

  def has_image
    if self.image_location.blank? && self.remote_image_location_url.blank?
      errors.add(:image_location, "must be provided")
    end
  end

  private


  def delete_from_cloudinary
    public_id = self.image_location.file.public_id
    Cloudinary::Uploader.destroy(public_id)
  end
end

