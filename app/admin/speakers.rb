ActiveAdmin.register Speaker do
  permit_params :name, :slug, :image_url, person_infos_attributes: [:person_id, :category, :content, :order, :id, :_destroy]

  show do
    attributes_table do
      row :name
      row :slug
      row :image_url
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
      f.input :image_url
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
