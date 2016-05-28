ActiveAdmin.register Photo do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  # category_ids allows categories to be added.
  permit_params :image_location, :image_location_cache, :caption_title,
                :caption_description, :category_ids => []

  menu priority: 1
  filter :categories, as: :check_boxes

  index as: :grid, columns: 3 do |photo|
    div class: "photo-holder" do
      resource_selection_cell photo
      h4 photo.caption_title
      div link_to image_tag(photo.image_location, width: 200), edit_admin_photo_path(photo)
      div photo.caption_description
      ul class: "category-list"
        photo.categories.each do |category|
          li category.name
        end
    end
  end


  form do |f|
    f.inputs do
      f.input :image_location, :as => :file,
              :hint => image_tag(f.object.image_location.url, width: 200)
      f.input :image_location_cache, :as => :hidden
      f.input :caption_title
      f.input :caption_description
      f.input :categories
    end

    f.actions
  end

end
