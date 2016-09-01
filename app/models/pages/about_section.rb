class Pages::AboutSection < ActiveRecord::Base
  validates :header, presence: true, length: { maximum: 30 }
  validates :content, presence: true
end
