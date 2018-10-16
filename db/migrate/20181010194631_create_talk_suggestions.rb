class CreateTalkSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :talk_suggestions do |t|
      t.string :session_type
      t.string :speakers
      t.string :subject

      t.timestamps
    end
  end
end
