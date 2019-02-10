class AddTrackToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :track, :string, default: '', allow_nil: false
  end
end
