# == Schema Information
#
# Table name: faqs
#
#  id             :bigint(8)        not null, primary key
#  active         :boolean          default(FALSE), not null
#  answer         :text             default(""), not null
#  position       :integer
#  question       :string           default(""), not null
#  render_as_html :boolean          default(FALSE)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Faq < ApplicationRecord
  acts_as_list

  has_one_attached :image

  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc) }

  def activate!
    self.update(active: true)
  end

  def deactivate!
    self.update(active: false)
  end
end
