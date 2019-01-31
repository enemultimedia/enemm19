class CreateEventsSpeakers < ActiveRecord::Migration[5.2]
  def change
    create_table :events_speakers do |t|
      t.integer :event_id
      t.integer :speaker_id

      t.timestamps
    end
  end
end
