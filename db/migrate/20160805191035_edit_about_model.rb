class EditAboutModel < ActiveRecord::Migration
  def change
    rename_table :abouts, :about_sections
    add_column :about_sections, :header, :text
  end
end
