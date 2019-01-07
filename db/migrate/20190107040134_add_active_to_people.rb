class AddActiveToPeople < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :active, :boolean, default: false
  end
end
