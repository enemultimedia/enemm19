class AddPositionToPerson < ActiveRecord::Migration[5.2]
  def up
    add_column :people, :position, :integer
    Speaker.order(:created_at).each.with_index(1) do |speaker, index|
      speaker.update_column :position, index
    end
    Ambassador.order(:created_at).each.with_index(1) do |ambassador, index|
      ambassador.update_column :position, index
    end
  end

  def down
    remove_column :people, :position
  end
end
