class TalkSuggestion < ApplicationRecord
  validates :session_type, presence: true
  validates :speakers, presence: true
  validates :subject, presence: true
end
