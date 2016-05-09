# == Schema Information
#
# Table name: stages
#
#  id         :integer          not null, primary key
#  position   :integer
#  from       :string
#  to         :string
#  distance   :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_stages_on_position  (position)
#

class Stage < ActiveRecord::Base
  # Scopes
  default_scope { order(position: :asc) }

  # Validations
  validates :position, :from, :to, :distance, presence: true
  validates_uniqueness_of :position
  validate :position_sequence # Validate if position is correct (based on a position sequence)

  # Associations
  has_many :finished_stages
  has_many :users, through: :finished_stages

  def next_stage
    next_position = self.position + 1
    Stage.find_by(position: next_position)
  end

  def previous_stage
    previous_position = self.position - 1
    Stage.find_by(position: previous_position)
  end

  def distance_traveled(km)
    distance_until_current_stage = Stage.where('position < ?', self.position).sum(:distance)
    km - distance_until_current_stage
  end

  private

    def position_sequence
      max = Stage.maximum(:position)
      max = 0 if !max
      self.position == max + 1
    end
end
