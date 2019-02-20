class RemovePlaceFromEvents < ActiveRecord::Migration[5.2]
  def up
    remove_column :events, :place, :string
  end

  def down
    add_column :events, :place, :string, default: '', allow_nil: false
  end
end
