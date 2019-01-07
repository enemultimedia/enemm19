ActiveAdmin.register Speaker do
  permit_params :name, :slug, :image, person_infos_attributes: [:person_id, :category, :content, :order, :id, :_destroy]

  show do
    attributes_table do
      row :name
      row :slug
      row :image do |s|
        image_tag(url_for(s.image), height: '256') if s.image.attached?
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
    f.inputs 'Details' do
      f.input :name
      f.input :slug
      f.input :image, as: :file, :hint => f.object.image.attached? \
                                  ? image_tag(url_for(f.object.image), height: '256') \
                                  : content_tag(:span, "No image yet")
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
end
