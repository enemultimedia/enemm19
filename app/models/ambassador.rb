# == Schema Information
#
# Table name: people
#
#  id            :bigint(8)        not null, primary key
#  type          :string
#  name          :string
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  active        :boolean          default(FALSE)
#  company       :string           default(""), not null
#  facebook_link :string           default(""), not null
#

class Ambassador < Person
end
