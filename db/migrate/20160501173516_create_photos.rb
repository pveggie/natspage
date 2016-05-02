class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_location
      t.string :image_alt
      t.string :caption_title
      t.string :caption_description
      t.string :category
      t.boolean :front_page, default: false

      t.timestamps null: false
    end
  end
end
