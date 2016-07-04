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
  validates :image_location, :remote_image_location_url, presence: true
# == Scopes ===============================================================

# == Callbacks ============================================================
  after_destroy :delete_from_cloudinary
# == Class Methods ========================================================

# == Instance Methods =====================================================
  # used to add relevant css classes to each photo


  private
  def delete_from_cloudinary
    public_id = self.image_location.file.public_id
    Cloudinary::Uploader.destroy(public_id)
  end
end

