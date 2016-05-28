ActiveAdmin.register Photo do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  permit_params :image_location, :image_location_cache, :caption_title, :caption_description

  menu priority: 1
  filter :categories, as: :check_boxes

  index as: :grid, columns: 3 do |photo|
    link_to image_tag(photo.image_location, width: 200), admin_photo_path(photo)
  end

    form do |f|
      f.inputs 'Image' do
        f.input :image_location
        f.input :caption_title
        f.input :caption_description
      end
    f.inputs 'Categories', :categories
    f.actions
  end

end
