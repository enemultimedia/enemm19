# == Schema Information
#
# Table name: person_infos
#
#  id         :bigint(8)        not null, primary key
#  category   :integer
#  content    :string
#  order      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  person_id  :bigint(8)
#
# Indexes
#
#  index_person_infos_on_person_id  (person_id)
#
# Foreign Keys
#
#  fk_rails_...  (person_id => people.id)
#

class PersonInfo < ApplicationRecord
  belongs_to :person, optional: true

  enum category: [:title, :paragraph, :link, :spacer]
end
