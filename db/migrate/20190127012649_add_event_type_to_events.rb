class AddEventTypeToEvents < ActiveRecord::Migration[5.2]
  def up
    add_column :events, :event_type, :integer, default: 0, allow_nil: false
  end

  def down
    remove_column :events, :event_type
  end
end
