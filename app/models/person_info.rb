class PersonInfo < ApplicationRecord
  belongs_to :person, optional: true

  enum category: [:title, :paragraph, :link, :spacer]
end
