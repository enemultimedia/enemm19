# == Schema Information
#
# Table name: locations
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(FALSE)
#  label      :string           default("")
#  latitude   :decimal(, )      default(40.1929618)
#  longitude  :decimal(, )      default(-8.4083511)
#  name       :string           default("")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Location < ApplicationRecord
  has_many :events

  scope :active, -> { where(active: true) }

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end

  def google_link
    "https://www.google.com/maps/place/#{self.latitude},#{self.longitude}"
  end
end
