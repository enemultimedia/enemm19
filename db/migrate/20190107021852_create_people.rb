class CreatePeople < ActiveRecord::Migration[5.2]
  def up
    create_table :people do |t|
      t.string :type
      t.string :name
      t.string :slug
      t.string :image_url

      t.timestamps
    end
  end

  def down
    drop_table :people
  end
end
