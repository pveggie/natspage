class CategoryEntry < ActiveRecord::Base
  belongs_to :photo, dependent: :destroy
  belongs_to :category, dependent: :destroy
end
