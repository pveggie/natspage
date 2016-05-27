class CreateCategoryEntries < ActiveRecord::Migration
  def change
    create_table :category_entries do |t|
      t.references :photo, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
