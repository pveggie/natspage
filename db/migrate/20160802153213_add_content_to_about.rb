class AddContentToAbout < ActiveRecord::Migration
  def change
    add_column :abouts, :content, :text
  end
end
