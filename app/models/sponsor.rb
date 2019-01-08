# == Schema Information
#
# Table name: sponsors
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(FALSE)
#  name       :string
#  type       :string
#  website    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sponsor < ApplicationRecord
  has_one_attached :logo

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(created_at: :asc) }
  scope :kapa, -> { where(type: 'Kapa') }
  scope :mega, -> { where(type: 'Mega') }
  scope :giga, -> { where(type: 'Giga') }

  require_dependency 'kapa'
  require_dependency 'mega'
  require_dependency 'giga'

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end
end
