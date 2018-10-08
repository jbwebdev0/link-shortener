class ShortenedLink < ApplicationRecord
	validates :original_url, presence: true, on: create
	before_create :generate_short_url
	
	def generate_short_url
		chars = [*('a'..'z'),*('A'..'Z'),*('0'..'9')]
		url = 8.times.map {chars.sample}.join
		self.short_url = url
	end
end
