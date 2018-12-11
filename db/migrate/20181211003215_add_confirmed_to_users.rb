class AddConfirmedToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :confirmed, :boolean, default: false
  end

  def down
    remove_column :users, :confirmed
  end
end
