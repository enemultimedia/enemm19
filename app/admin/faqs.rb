ActiveAdmin.register Faq do
  config.sort_order = 'position_asc'
  config.paginate = false
  reorderable
  permit_params :id, :position, :image, :active, :question, :answer

  index as: :reorderable_table do
    selectable_column
    column :active
    column :question
    column :answer
    column :image do |f|
      image_tag(url_for(f.image), height: '64') if f.image.attached?
    end
    actions
  end

  filter :active

  show do
    attributes_table do
      row :question
      row :answer
      row :active
      row :image do |f|
        image_tag(url_for(f.image), height: '256') if f.image.attached?
      end
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :question
      f.input :answer
      f.input :active
      f.input :image, as: :file, :hint => f.object.image.attached? \
                                  ? image_tag(url_for(f.object.image), height: '256') \
                                  : content_tag(:span, "No image yet")
    end
    f.actions
  end

  batch_action :activate do |ids|
    batch_action_collection.find(ids).each do |faq|
      faq.activate!
    end
    redirect_to collection_path, notice: "The selected Faqs have been activated."
  end

  batch_action :disable do |ids|
    batch_action_collection.find(ids).each do |faq|
      faq.deactivate!
    end
    redirect_to collection_path, notice: "The selected Faqs have been disabled."
  end

  batch_action :destroy, false

  member_action :activate, method: :put do
    resource.activate!
    redirect_to resource_path, notice: 'Activated!'
  end

  action_item :activate, only: :show, if: proc{ !faq.active? } do
    link_to 'Activate', activate_admin_faq_path(faq), method: :put
  end

  member_action :disable, method: :put do
    resource.deactivate!
    redirect_to resource_path, notice: 'Disabled!'
  end

  action_item :disable, only: :show, if: proc{ faq.active? } do
    link_to 'Disable', disable_admin_faq_path(faq), method: :put
  end
end
