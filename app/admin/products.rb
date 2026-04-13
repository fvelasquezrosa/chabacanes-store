ActiveAdmin.register Product do
  permit_params :title, :description, :price, :stock_quantity, :category_id, :image, tag_ids: []

  config.filters = false

  index do
    selectable_column
    id_column
    column :title
    column :category
    column :price
    column :stock_quantity
    column :created_at
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :price
      f.input :stock_quantity
      f.input :category
      f.input :tags, as: :check_boxes
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :price
      row :stock_quantity
      row :category
      row :created_at
      row :updated_at
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), style: "max-width: 200px;"
        else
          "No image uploaded"
        end
      end
    end
  end
end