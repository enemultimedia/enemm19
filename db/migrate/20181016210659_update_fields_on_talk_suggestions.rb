class UpdateFieldsOnTalkSuggestions < ActiveRecord::Migration[5.2]
  def up
    add_column :talk_suggestions, :subject_or_speaker, :string
    add_column :talk_suggestions, :tell_us_more, :text
    remove_column :talk_suggestions, :session_type
    remove_column :talk_suggestions, :speakers
    remove_column :talk_suggestions, :subject
  end

  def down
    add_column :talk_suggestions, :session_type, :string
    add_column :talk_suggestions, :speakers, :string
    add_column :talk_suggestions, :subject, :string
    remove_column :talk_suggestions, :subject_or_speaker
    remove_column :talk_suggestions, :tell_us_more
  end
end
