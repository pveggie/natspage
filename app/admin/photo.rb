ActiveAdmin.register Photo do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  # category_ids allows categories to be added.
  permit_params :image_location, :image_location_cache, :caption_title,
                :caption_description, :category_ids => []

  menu priority: 1
  filter :categories, as: :check_boxes

  sortable

  # **** CUSTOM VIEWS **** #
  # INDEX GRID VIEW - DETAILS
  index as: :grid, columns: 3, label: "Details" do |photo|
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
  # INDEX SORTABLE VIEW - REORDER
  index :as => :sortable do
    label do |photo|
      image_tag photo.image_location.url, width: 200
    end

    # label :caption_title
    # label :caption_description


    actions
  end


  # NEW/EDIT VIEW
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
