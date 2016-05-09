# == Schema Information
#
# Table name: finished_stages
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  stage_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_finished_stages_on_user_id_and_stage_id  (user_id,stage_id) UNIQUE
#

class FinishedStage < ActiveRecord::Base

  # Validations
  validates :user, :stage, presence: true
  validates_uniqueness_of :user, scope: :stage

  # Associations
  belongs_to :user
  belongs_to :stage

end
