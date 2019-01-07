class Person < ApplicationRecord
  has_many :person_infos, -> { order(order: :asc) }
  has_one_attached :image
  accepts_nested_attributes_for :person_infos, allow_destroy: true
end
