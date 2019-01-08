ActiveAdmin.register Sponsor do
  permit_params :id, :name, :type, :website, :logo, :active

  index do
    selectable_column
    id_column
    column :active
    column :name
    column :type
    column :website
    column :logo do |s|
      image_tag(url_for(s.logo), height: '64') if s.logo.attached?
    end
    actions
  end

  filter :type_eq, as: :select, collection: Sponsor.subclasses, label: 'Type'

  show do
    attributes_table do
      row :name
      row :type
      row :website
      row :active
      row :logo do |s|
        image_tag(url_for(s.logo), height: '64') if s.logo.attached?
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      f.input :type, as: :select, collection: Sponsor.subclasses
      f.input :website
      f.input :active
      f.input :logo, as: :file, :hint => f.object.logo.attached? \
                                  ? image_tag(url_for(f.object.logo), height: '256') \
                                  : content_tag(:span, "No logo yet")
    end
    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |sponsor|
      sponsor.activate!
    end
    redirect_to collection_path, notice: "The selected sponsors have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |sponsor|
      sponsor.deactivate!
    end
    redirect_to collection_path, notice: "The selected sponsors have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !sponsor.active? } do
    link_to 'Activate', activate_admin_sponsor_path(sponsor), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ sponsor.active? } do
    link_to 'Disable', disable_admin_sponsor_path(sponsor), method: :put
  end
end
