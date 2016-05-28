class CategoryEntry < ActiveRecord::Base
  belongs_to :photo, dependent: :destroy
  belongs_to :category, dependent: :destroy

  validates_presence_of :photo
  validates_presence_of :category

  accepts_nested_attributes_for :photo
end
