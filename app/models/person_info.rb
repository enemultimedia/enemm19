class PersonInfo < ApplicationRecord
  belongs_to :person

  enum category: [:title, :paragraph, :link, :spacer]
end
