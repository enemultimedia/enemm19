# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  active      :boolean          default(FALSE), not null
#  description :text             default(""), not null
#  end         :datetime
#  event_type  :integer          default("Talk")
#  place       :string           default(""), not null
#  position    :integer
#  start       :datetime
#  title       :string           default(""), not null
#  track       :string           default("")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#

class Event < ApplicationRecord
  acts_as_list scope: [:start]
  acts_as_taggable

  has_and_belongs_to_many :speakers, join_table: "events_speakers"
  belongs_to :location

  enum event_type: {Talk: 0, Panel: 1, Exhibit: 2, Meal: 3, Night: 4, Workshop: 5, Other: 6}

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(start: :asc) }

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end

  def start_hour
    self.start.strftime("%H:%M")
  end

  def end_hour
    self.end.strftime("%H:%M")
  end

  def time_range
    "#{self.start_hour} - #{self.end_hour}"
  end
end
