# This will guess the User class
FactoryGirl.define do

  factory :category do
    name Faker::Lorem.words(2)
  end

  factory :photo do
    remote_image_location_url Faker::Avatar.image
    caption_title Faker::Lorem.words(1, false)
    caption_description Faker::Hipster.sentence(4)
    category_ids { create(:category)[:id] }
  end

  factory :category_entry do
    photo_id { create(:photo)[:id] }
    category_id { create(:category)[:id] }
  end
end

