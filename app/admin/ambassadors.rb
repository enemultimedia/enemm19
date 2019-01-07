ActiveAdmin.register Ambassador do
  permit_params :id, :name, :slug, :institution, :facebook_link, :image, :active

  index do
    selectable_column
    id_column
    column :active
    column :name
    column :slug
    column :institution
    column :facebook_link
    column :image do |s|
      image_tag(url_for(s.image), height: '64') if s.image.attached?
    end
    actions
  end

  filter :active

  show do
    attributes_table do
      row :name
      row :slug
      row :institution
      row :facebook_link
      row :active
      row :image do |s|
        image_tag(url_for(s.image), height: '256') if s.image.attached?
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      f.input :slug
      f.input :institution
      f.input :facebook_link
      f.input :active
      f.input :image, as: :file, :hint => f.object.image.attached? \
                                  ? image_tag(url_for(f.object.image), height: '256') \
                                  : content_tag(:span, "No image yet")
    end
    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |ambassador|
      ambassador.activate!
    end
    redirect_to collection_path, notice: "The selected ambassadors have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |ambassador|
      ambassador.deactivate!
    end
    redirect_to collection_path, notice: "The selected ambassadors have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !ambassador.active? } do
    link_to 'Activate', activate_admin_ambassador_path(ambassador), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ ambassador.active? } do
    link_to 'Disable', disable_admin_ambassador_path(ambassador), method: :put
  end
end
