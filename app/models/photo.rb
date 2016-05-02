class Photo < ActiveRecord::Base
  scope :front_page, -> { where(front_page: true) }
end
