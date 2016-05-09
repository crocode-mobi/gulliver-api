# == Schema Information
#
# Table name: hydratations
#
#  id          :integer          not null, primary key
#  quantity    :float
#  user_id     :integer
#  consumed_at :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_hydratations_on_user_id_and_consumed_at  (user_id,consumed_at) UNIQUE
#

class Hydratation < ActiveRecord::Base
  # Scopes
  scope :until_today, -> { where('consumed_at < ?', Time.zone.today).order(consumed_at: :desc) }

  # Validations
  validates :user, presence: true
  validates :quantity, :consumed_at, presence: true
  validates :quantity, inclusion: { in: 0.0..8.0, message: "%{value} isnt valid. Should be in 0..8 range" }
  validates_uniqueness_of :consumed_at, scope: :user_id

  # Associations
  belongs_to :user

  def self.for_today
    self.where(consumed_at: Time.zone.today).first
  end

  def to_centiliters
    self.quantity * 25
  end

  def level
    (self.quantity * 100)/8
  end

end
