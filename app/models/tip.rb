# == Schema Information
#
# Table name: tips
#
#  id                 :integer          not null, primary key
#  title              :string
#  description        :text
#  section            :string
#  points             :integer          default("0")
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#
# Indexes
#
#  index_tips_on_section  (section)
#

class Tip < ActiveRecord::Base
  # Attributes
  attr_reader :image_url

  # Scopes
  scope :hydratation, -> { where(section: "hydratation") }
  scope :meal, -> { where(section: "meal") }
  scope :running, -> { where(section: "running") }
  scope :other, -> { where(section: "other") }

  # Associations
  has_many :viewed_tips, dependent: :destroy
  has_many :users, through: :viewed_tips
  # Attachments
  has_attached_file :image, styles: {
    square: '250x250#',
    medium: '800x400>'
  }

  # Validations
  validates :title, :description, :section, :points, presence: true
  validates :section, inclusion: { in: %w(all hydratation meal running other),
                      message: "%{value} is not valid. Should be 'all', 'hydratation', 'running', 'other' or 'meal'" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence     :image

  def image_url=(url)
		self.image = URI.parse(url)
		@image_url = url
	end
end
