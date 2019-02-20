class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.decimal :latitude, default: 40.1929618
      t.decimal :longitude, default: -8.4083511
      t.string :name, default: '', allow_nil: false
      t.boolean :active, default: false, allow_nil: false

      t.timestamps
    end
  end
end
