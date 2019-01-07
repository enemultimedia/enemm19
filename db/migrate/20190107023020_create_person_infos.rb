class CreatePersonInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :person_infos do |t|
      t.references :person, foreign_key: true
      t.integer :order
      t.integer :category
      t.string :content

      t.timestamps
    end
  end
end
