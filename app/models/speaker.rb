# == Schema Information
#
# Table name: people
#
#  id            :bigint(8)        not null, primary key
#  active        :boolean          default(FALSE)
#  company       :string           default(""), not null
#  facebook_link :string           default(""), not null
#  name          :string
#  position      :integer
#  slug          :string
#  type          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Speaker < Person
  acts_as_list

  has_and_belongs_to_many :events, join_table: "events_speakers"

  scope :with_events, -> { joins(:events) }
end
