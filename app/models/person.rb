class Person < ApplicationRecord
  has_many :person_infos, -> { order(order: :asc) }
  has_one_attached :image
  accepts_nested_attributes_for :person_infos, allow_destroy: true

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(created_at: :asc) }
  scope :with_info, -> { includes(:person_infos) }

  alias_attribute :institution, :company

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end
end
