class AddApprovedToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :approved, :boolean, default: false, null: false
    add_index  :users, :approved
  end

  def down
    remove_column :users, :approved
    remove_index :users, :approved if index_exists?(:users, :approved)
  end
end
