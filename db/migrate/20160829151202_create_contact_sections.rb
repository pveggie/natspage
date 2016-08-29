class CreateContactSections < ActiveRecord::Migration
  def change
    create_table :contact_sections do |t|
      t.text :email
      t.text :facebook_url
      t.text :flickr_url
      t.text :twitter_url
      t.text :instagram_url

      t.timestamps null: false
    end
  end
end
