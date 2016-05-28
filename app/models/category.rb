class Category < ActiveRecord::Base
  has_many :category_entries
  has_many :photos, through: :category_entries
end
