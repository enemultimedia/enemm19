class TalkSuggestion < ApplicationRecord
  validates :subject_or_speaker, presence: true
  validates :tell_us_more, presence: true
end
