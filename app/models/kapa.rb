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

class Kapa < Sponsor
end
