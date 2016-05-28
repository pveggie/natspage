class RemoveCategoriesFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :category
    remove_column :photos, :front_page
  end
end
