# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email               :string
#  name                :string
#  salt                :string
#  encrypted_password  :string
#  birthday            :date
#  genre               :string
#  weight              :integer
#  height              :integer
#  location            :string
#  account_status      :integer          default("0")
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  sash_id             :integer
#  level               :integer          default("0")
#  total_steps         :integer          default("0")
#  total_distance      :float            default("0.0")
#  total_kcal          :float            default("0.0")
#  last_activity_at    :date
#  current_stage_id    :integer
#  started_at          :date
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ActiveRecord::Base
  include Authenticable

  # Attributes
  enum account_status: [:active, :inactive]
  attr_reader :avatar_url

  # Scopes
  scope :not_me, -> (me) { where('id != ?', me.id) }

  # Associations
  belongs_to :current_stage, class_name: 'Stage', foreign_key: 'current_stage_id'
  has_many :user_tokens,  dependent: :destroy
  has_many :activities,   dependent: :destroy
  has_many :hydratations, dependent: :destroy
  has_many :meals,        dependent: :destroy
  has_many :viewed_tips,  dependent: :destroy
  has_many :tips,         through:   :viewed_tips
  has_many :finished_stages, dependent: :destroy
  has_many :stages,       through: :finished_stages
  # Attachments
  has_attached_file :avatar, styles: {
    square: '250x250#',
    medium: '800x400>'
  }
  # Gamification
  has_merit

  # Validations
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :password, presence: true, on: :create
	validates :password, length: { minimum: 6 }, on: :create
  validates :genre, presence: true
  validates :genre, inclusion: { in: %w(female male), message: "%{value} is not valid. Should be 'female' or 'male'" }
  validates :weight, presence: true
  validates :height, presence: true
  validates :name, presence: true
  validates :location, presence: true
  validates :location, inclusion: { in: CountryLocation.new.subregions_array, message: "%{value} is not valid" }
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence     :avatar

  def generate_token(push_token, device, ip)
		self.user_tokens.create! push_token: push_token, device: device, ip: ip
	end

  def hydratate(quantity=0)
    h2o = self.hydratations.find_or_initialize_by(consumed_at: Time.zone.today)
    h2o.quantity = quantity.to_f
    h2o.save
    h2o
  end

  def prepare_for_meal(date=Time.zone.today)
    meal = self.meals.new
    meal.prepare_for_meal(date)
  end

  def eat(food)
    meal = self.meals.find_or_initialize_by(consumed_at: Time.zone.today)
    meal.update(food)
    meal
  end

  def total_days_running
    self.started_at ? (Time.zone.today - self.started_at).to_i : 0
  end

  def avatar_url=(url)
		self.avatar = URI.parse(url)
		@avatar_url = url
	end


end
