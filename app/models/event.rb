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
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  acts_as_list scope: [:start]
  acts_as_taggable

  enum event_type: {Talk: 0, Panel: 1, Exhibit: 2, Meal: 3, Night: 4}

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end
end
