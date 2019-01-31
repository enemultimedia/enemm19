# == Schema Information
#
# Table name: events_speakers
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  speaker_id :integer
#

class EventsSpeaker < ApplicationRecord
  belongs_to :event
  belongs_to :speaker
end
