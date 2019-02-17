ActiveAdmin.register Event do
  config.sort_order = ''
  controller do
    def scoped_collection
      Event.order('start asc, position asc')
    end
  end
  config.paginate = false
  reorderable
  permit_params :id, :position, :active, :start, :end, :place, :title, :description, :event_type, :speaker_ids => [], :tag_ids => []

  index as: :reorderable_table do
    selectable_column
    column :active
    column :start
    column :end
    column :title
    column :event_type
    column :track
    column :tags do |e|
      e.tags.join(', ')
    end
    actions
  end

  filter :active
  filter :event_type, as: :select, collection: proc { Event.event_types }
  filter :title_contains, label: 'Name'

  show do
    attributes_table do
      row :title
      row :event_type
      row :start
      row :end
      row :place
      row :description
      row :active
      row :speakers do |e|
        e.speakers.map(&:name).join(', ')
      end
      row :tags do |e|
        e.tags.join(', ')
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :event_type, as: :select
      f.input :start, as: :date_time_picker
      f.input :end, as: :date_time_picker
      f.input :place
      f.input :description
      f.input :active
      f.input :speaker_ids, as: :selected_list
      f.input :tags,
        as: :select,
        multiple: :true,
        collection: ActsAsTaggableOn::Tag.select(:id, :name).all
    end
    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |event|
      event.activate!
    end
    redirect_to collection_path, notice: "The selected events have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |event|
      event.deactivate!
    end
    redirect_to collection_path, notice: "The selected events have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !event.active? } do
    link_to 'Activate', activate_admin_event_path(event), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ event.active? } do
    link_to 'Disable', disable_admin_event_path(event), method: :put
  end
end
