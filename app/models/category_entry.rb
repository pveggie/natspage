class CategoryEntry < ActiveRecord::Base
  belongs_to :photo
  belongs_to :category

  validates :photo, presence: true
  validates :category, presence: true
end
