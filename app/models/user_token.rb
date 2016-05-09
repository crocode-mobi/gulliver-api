# == Schema Information
#
# Table name: user_tokens
#
#  id         :integer          not null, primary key
#  token      :string
#  user_id    :integer
#  push_token :string
#  ip         :string
#  device     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_user_tokens_on_token  (token)
#

class UserToken < ActiveRecord::Base
  DEVICE_TYPES = ["ios", "android", "web"]

  # Callbacks
  before_create :generate_token

  # Associations
  belongs_to :user

  # Validations
  validates :user, :device, presence: true
  validates_inclusion_of :device, { :in => DEVICE_TYPES,
                                  :message => "%{value} should be ios, android or web" }

  def self.devices_tokens
    self.map(&:push_token).compact
  end

  private

    def generate_token
      begin
        self.token = SecureRandom.hex
      end while self.class.exists?(token: token)
    end

end
