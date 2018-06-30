class Portfolio < ApplicationRecord
	has_many :technologies
	accepts_nested_attributes_for :technologies, reject_if: lambda { |attrs| attrs['name'].blank? }

	include Placeholder
	validates :title, :body, :main_image, :thumb_image, presence: true

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

	scope :angular, lambda { where(subtitle: 'Angular') }
	scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails') }
  scope :by_position, -> { order("position ASC") }

	after_initialize :set_defaults

	def set_defaults
		self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
		self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
	end
end
