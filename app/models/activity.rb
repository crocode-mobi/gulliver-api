# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  steps      :integer          default("0")
#  distance   :float            default("0.0")
#  kcal       :float            default("0.0")
#  done_at    :date
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_activities_on_done_at_and_user_id  (done_at,user_id) UNIQUE
#

class Activity < ActiveRecord::Base

  # Validations
  validates :steps, :distance, :kcal, presence: true
  validates_uniqueness_of :done_at, scope: :user
  validates :done_at, presence: true
  validates :user, presence: true

  # Associations
  belongs_to :user

end
