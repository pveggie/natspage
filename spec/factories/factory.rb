FactoryBot.define do
  # users
  factory :user do
    email "test@test.com"
    password "test_password"

    factory :admin do
      admin true
    end
  end

  # photos and categories
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
      image_location File.open(
        File.join(Rails.root, 'spec/assets/test_image.jpg')
      )
      category_ids { [create(:category)[:id]] }
    end
  end

  factory :category_entry do
    photo_id { create(:remote_photo)[:id] }
    category_id { create(:category)[:id] }
  end

  # pages
  factory :about_section, class: Pages::AboutSection do
    header Faker::Lorem.words(2, false).join
    content Faker::Lorem.paragraphs(2)
  end

  factory :contact_section, class: Pages::ContactSection do
    email Faker::Internet.email
    facebook_url Faker::Internet.url('facebook.com')
    flickr_url Faker::Internet.url('flickr.com')
    twitter_url Faker::Internet.url('twitter.com')
    instagram_url Faker::Internet.url('instagram.com')
  end
end
