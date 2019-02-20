ActiveAdmin.register Location do
  config.paginate = false
  permit_params :id, :active, :name, :latitude, :longitude

  index  do
    selectable_column
    column :active
    column :name
    column :latitude
    column :longitude
    actions
  end

  filter :active

  show do
    attributes_table do
      row :name
      row :latitude
      row :longitude
      row :active
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :latitude
      f.input :longitude
      f.input :active
    end
    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |location|
      location.activate!
    end
    redirect_to collection_path, notice: "The selected locations have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |location|
      location.deactivate!
    end
    redirect_to collection_path, notice: "The selected locations have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !location.active? } do
    link_to 'Activate', activate_admin_location_path(location), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ location.active? } do
    link_to 'Disable', disable_admin_location_path(location), method: :put
  end
end
