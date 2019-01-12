# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  active      :boolean          default(FALSE), not null
#  description :text             default(""), not null
#  end         :datetime
#  place       :string           default(""), not null
#  position    :integer
#  start       :datetime
#  title       :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  acts_as_list scope: [:start]
end
