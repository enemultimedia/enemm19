ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    id_column
    column :approved
    column :email
    actions
  end

  filter :email
  filter :approved

  show do
    attributes_table do
      row :email
      row :approved
    end
    active_admin_comments
  end

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :approved
    end
    f.actions
  end

  batch_action :approve do |ids|
    batch_action_collection.find(ids).each do |user|
      user.approve!
    end
    redirect_to collection_path, notice: "The selected users have been approved!"
  end

  batch_action :lock do |ids|
    batch_action_collection.find(ids).each do |user|
      user.lock! unless user==current_user
    end
    redirect_to collection_path, notice: "The selected users have been locked!"
  end

  batch_action :destroy, false

  member_action :approve, method: :put do
    resource.approve!
    redirect_to resource_path, notice: 'Approved!'
  end

  action_item :approve, only: :show, if: proc{ !user.approved? } do
    link_to 'Approve', approve_admin_user_path(user), method: :put
  end

  member_action :lock, method: :put do
    resource.lock!
    redirect_to resource_path, notice: 'Locked!'
  end

  action_item :lock, only: :show, if: proc{ user.approved? && !user == current_user } do
    link_to 'Lock', lock_admin_user_path(user), method: :put
  end
end
