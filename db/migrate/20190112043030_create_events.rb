class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.boolean :active, default: false, null: false
      t.string :title, default: '', null: false
      t.text :description, default: '', null: false
      t.datetime :start
      t.datetime :end
      t.string :place, default: '', null: false
      t.integer :position

      t.timestamps
    end
  end
end
