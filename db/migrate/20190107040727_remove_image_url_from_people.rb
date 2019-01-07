class RemoveImageUrlFromPeople < ActiveRecord::Migration[5.2]
  def up
    remove_column :people, :image_url, :string
  end

  def down
    add_column :people, :image_url, :string
  end
end
