ActiveAdmin.register Photo do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters

  # category_ids allows categories to be added.
  permit_params :image_location, :image_location_cache, :caption_title,
                :caption_description, :category_ids => []

  menu priority: 1
  filter :categories, as: :check_boxes

  # **** HELPERS *****

  #Index Helper
  #for sorting photos
  collection_action :reorder, method: :patch do
    reorder_params = params.require(:photos).map {|photo| photo.permit(:id, :position) }

    reorder_ids        = reorder_params.map {|photo| photo[:id] }
    reorder_attributes = reorder_params.map {|photo| photo.slice(:position) }

    resource_class.update(reorder_ids, reorder_attributes)

    render json: { status: "success" }
  end

  # **** CUSTOM VIEWS **** #

  # INDEX GRID VIEW
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

  # INDEX TABLE VIEW
  # sortable :position, :as => :grid do |photo|
  #   div image_tab(photo.image_location, width: 200)
  # end
  # index do |photo|
  #   reorderable_column(self)
  #   selectable_column
  #   column image_tag(photo.image_location)
  #   # etc...
  # end


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

  # ******* CUSTOM CONTROLLERS *********#
  controller do
  private

  def reorderable_column(dsl)
    # Don't allow reordering if filter(s) present
    # or records aren't sorted by `order`
    return if params[:q].present? || params[:order] != "order"

    dsl.column(sortable: false) do
      dsl.fa_icon :arrows, class: "js-reorder-handle"
    end
  end

  helper_method :reorderable_column
end


end
