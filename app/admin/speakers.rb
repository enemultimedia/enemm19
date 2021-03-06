ActiveAdmin.register Speaker do
  config.sort_order = 'position_asc'
  config.paginate = false
  reorderable
  permit_params :id, :position, :name, :slug, :company, :image, :active, person_infos_attributes: [:person_id, :category, :content, :order, :id, :_destroy], :event_ids => []

  index as: :reorderable_table do
    selectable_column
    column :active
    column :name
    column :slug
    column :company
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
      row :company
      row :active
      row :image do |s|
        image_tag(url_for(s.image), height: '256') if s.image.attached?
      end
      row :events do |s|
        s.events.map(&:title).join(', ')
      end
    end
    panel 'Info' do
      table_for speaker.person_infos do
        column :order
        column :category
        column :content
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Details' do
      f.input :name
      f.input :slug
      f.input :company
      f.input :active
      f.input :image, as: :file, :hint => f.object.image.attached? \
                                  ? image_tag(url_for(f.object.image), height: '256') \
                                  : content_tag(:span, "No image yet")
      f.input :event_ids, as: :selected_list, display_name: :title
    end

    f.inputs do
      f.has_many :person_infos,
                  heading: 'Info block',
                  allow_destroy: true,
                  new_record: true,
                  sortable: :order,
                  sortable_start: 1 do |pi|
        pi.input :category
        pi.input :content
      end
    end

    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |speaker|
      speaker.activate!
    end
    redirect_to collection_path, notice: "The selected speakers have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |speaker|
      speaker.deactivate!
    end
    redirect_to collection_path, notice: "The selected speakers have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !speaker.active? } do
    link_to 'Activate', activate_admin_speaker_path(speaker), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ speaker.active? } do
    link_to 'Disable', disable_admin_speaker_path(speaker), method: :put
  end
end
