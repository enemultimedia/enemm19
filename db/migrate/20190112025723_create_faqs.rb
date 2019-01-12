class CreateFaqs < ActiveRecord::Migration[5.2]
  def change
    create_table :faqs do |t|
      t.boolean :active
      t.string :question, default: '', null: false
      t.text :answer, default: '', null: false
      t.integer :position

      t.timestamps
    end
  end
end
