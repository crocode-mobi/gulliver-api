# == Schema Information
#
# Table name: products
#
#  id                 :integer          not null, primary key
#  title              :string
#  subtitle           :string
#  description        :text
#  points             :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class Product < ActiveRecord::Base
  attr_reader :image_url

  # Associations
  has_many :purchased_products, dependent: :destroy
  has_many :users,     through: :purchased_products
  # Attachments
  has_attached_file :image, styles: {
    square: '250x250#',
    medium: '800x400>'
  }

  # Validations
  validates :title, :subtitle, :description, :points, :image, presence: true
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
	validates_attachment_presence     :image

  def image_url=(url)
		self.image = URI.parse(url)
		@image_url = url
	end

end
