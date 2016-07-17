FactoryGirl.define do

  factory :user do
    email "test@test.com"
    password "test_password"

    factory :admin do
      admin true
    end
  end

  factory :category do
    name Faker::Lorem.words(2).join
  end

  factory :photo do
    caption_title Faker::Lorem.words(1, false).join
    caption_description Faker::Hipster.sentence(4)

    factory :remote_photo do
      remote_image_location_url Faker::Avatar.image
      category_ids { [create(:category)[:id]] }
    end

    factory :local_photo do
      image_location File.open(File.join(Rails.root, 'spec/assets/test_image.jpg'))
      category_ids { [create(:category)[:id]] }
    end
  end

  factory :category_entry do
    photo_id { create(:local_photo)[:id] }
    category_id { create(:category)[:id] }
  end
end

