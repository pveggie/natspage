# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

photo_images = [
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632705/zwimccmzgsh63vjsixzo.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632687/k2ybrz2zu6nuviakzatr.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632687/t8xgdfafkfzbztrfot5a.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632653/pqsca8t5nmhkaqighgup.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632631/jvussvvp2bsez7fkrosr.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632594/urs3txvccip5p9ut1scl.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632477/apzvlw27f6f6ubgr2uko.jpg",
  "http://res.cloudinary.com/domva0jha/image/upload/v1462632289/spegog4xuuhzcrkommz8.jpg"
]

photo_images.each do |image|
  Photo.create(remote_image_location_url: image)
end
