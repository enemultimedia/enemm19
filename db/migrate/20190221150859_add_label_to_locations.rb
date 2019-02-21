class AddLabelToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :label, :string, default: '', allow_nil: false
  end
end
