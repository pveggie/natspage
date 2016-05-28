class Category < ActiveRecord::Base
  has_many :category_entries, dependent: :destroy
  has_many :photos, through: :category_entries

  validates :name, presence: true
end
