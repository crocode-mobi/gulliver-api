# == Schema Information
#
# Table name: viewed_tips
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  tip_id     :integer
#  shared     :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_viewed_tips_on_user_id_and_tip_id  (user_id,tip_id) UNIQUE
#

class ViewedTip < ActiveRecord::Base
  # Validations
  validates :user, :tip, :shared, presence: true
  validates_uniqueness_of :user, scope: :tip

  # Associations
  belongs_to :user
  belongs_to :tip
end
