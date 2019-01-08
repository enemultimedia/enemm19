class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :name
      t.string :type
      t.string :link
      t.boolean :active, default: false

      t.timestamps
    end
  end
end
