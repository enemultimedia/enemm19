# == Schema Information
#
# Table name: faqs
#
#  id         :bigint(8)        not null, primary key
#  active     :boolean          default(FALSE), not null
#  answer     :text             default(""), not null
#  position   :integer
#  question   :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Faq < ApplicationRecord
  acts_as_list

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end
end
