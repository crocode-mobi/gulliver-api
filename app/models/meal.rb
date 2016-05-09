# == Schema Information
#
# Table name: meals
#
#  id          :integer          not null, primary key
#  cereal      :integer
#  fruit       :integer
#  vegetable   :integer
#  meat        :integer
#  dairy       :integer
#  sweets      :integer
#  fats        :integer
#  consumed_at :date
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_meals_on_user_id_and_consumed_at  (user_id,consumed_at) UNIQUE
#

class Meal < ActiveRecord::Base
  # Scopes
  scope :until_today, -> { where('consumed_at < ?', Time.zone.today).order(consumed_at: :desc) }

  # Validations
  validates :user, presence: :true
  validates :consumed_at, :cereal, :fruit, :vegetable, :meat, :dairy, :sweets, :fats, presence: true
  validates :cereal, :fruit, :vegetable, :meat, :dairy, :sweets, :fats,
            inclusion: { in: 0..1, message: "%{value} is not valid. Should be 0 or 1"}
  validates_uniqueness_of :consumed_at, scope: :user_id

  # Associations
  belongs_to :user

  def self.for_today
    self.where(consumed_at: Time.zone.today).first
  end

  def prepare_for_meal(date=Time.zone.today)
    self.update(consumed_at: date, cereal: 0, fruit: 0,
                          vegetable: 0, meat: 0, dairy: 0, sweets: 0, fats: 0)
  end
end
