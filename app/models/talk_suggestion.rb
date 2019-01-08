# == Schema Information
#
# Table name: talk_suggestions
#
#  id                 :bigint(8)        not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  subject_or_speaker :string
#  tell_us_more       :text
#

class TalkSuggestion < ApplicationRecord
  validates :subject_or_speaker, presence: true
  validates :tell_us_more, presence: true, length: {minimum: 10}
end
