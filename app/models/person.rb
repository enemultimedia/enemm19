class Person < ApplicationRecord
  has_many :person_infos
  accepts_nested_attributes_for :person_infos, allow_destroy: true
end
