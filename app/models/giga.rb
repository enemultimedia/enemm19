# == Schema Information
#
# Table name: sponsors
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(FALSE)
#  link       :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Giga < Sponsor
end
