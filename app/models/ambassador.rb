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

class Ambassador < Person
  acts_as_list
end
