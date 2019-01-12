ActiveAdmin.register Event do
  config.sort_order = ''
  controller do
    def scoped_collection
      Event.order('start asc, position asc')
    end
  end
  config.paginate = false
  reorderable
  permit_params :id, :position, :active, :start, :end, :place, :title, :description

  index as: :reorderable_table do
    selectable_column
    column :active
    column :start
    column :end
    column :title
    actions
  end

  filter :active

  show do
    attributes_table do
      row :title
      row :start
      row :end
      row :place
      row :description
      row :active
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :title
      f.input :start, as: :date_time_picker
      f.input :end, as: :date_time_picker
      f.input :place
      f.input :description
      f.input :active
    end
    f.actions
  end
end
