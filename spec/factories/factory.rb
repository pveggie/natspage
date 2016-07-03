# This will guess the User class
FactoryGirl.define do

  factory :category do
    name Faker::Lorem.words(2)
  end

  factory :photo do
    remote_image_location_url Faker::Avatar.image
    caption_title Faker::Lorem.words(3, true)
    caption_description Faker::Hipster.sentence(4, false, 3)
    category_ids { create(:category)[:id] }
  end
end

