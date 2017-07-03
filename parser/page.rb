require 'nokogiri'
require 'open-uri'

# Response page of search engine. One of many pages founded!
class Page
	attr_reader :url

	@@id = 0

	def initialize(web_page)
		@url = web_page

		doc = Nokogiri::HTML(open(web_page))

		@body = doc.at('body').content
	end

	def printf
		@@id+=1
		output_name = "output/file#{@@id}"
		File.open(output_name, 'w', encoding: 'UTF-8') { |file| file.write(tokenize.to_s) }
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
