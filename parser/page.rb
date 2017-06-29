require 'nokogiri'
require 'open-uri'

class Page
	attr_reader :url

	def initialize(web_page)
		@url = web_page

		doc = Nokogiri::HTML(open(web_page))

		@body = doc.at('body').content
	end

	def printf
		id = @url.gsub(/\W+/, '')
		File.open("output/" << id, 'w') { |file| file.write(tokenize.to_s) }
	end

	def tokenize
		# Get all content separated by ';'
		words = @body.gsub(/\s+/, ";")

		# tokenize each words
		token = words.split(";")

		filter(token)

		return token
	end

	def filter(token)
		token.each do |word|
			token.delete word if has_digits? word
		end
	end

	private

	def has_digits?(word)
		word.count("0-9") > 0
	end

end
