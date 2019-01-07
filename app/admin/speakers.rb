ActiveAdmin.register Speaker do
  permit_params :name, :slug, :image_url
end
