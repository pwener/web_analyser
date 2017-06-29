require 'nokogiri'
require 'open-uri'
require './page'

class AutoVisitor
	attr_reader :urls

	def initialize(web_site)
		search_page = open web_site
		@doc = Nokogiri::HTML(search_page)
		@urls = Array.new
	end

	def search_links
		@doc.search("cite").each do |url|
			link = url.inner_text
			if link.include? "http"
				@urls.push link
			end
		end
	end

end

url = "http://www.google.com/search?num=100&q=Lula"
visitor = AutoVisitor.new(url)
visitor.search_links()

puts "Found #{visitor.urls.size} urls"

visitor.urls.each do |url|
	encoded_url = URI.encode(url)
	final_uri = URI.parse(encoded_url).to_s
	begin
		p = Page.new(final_uri)
		p.printf
	rescue OpenURI::HTTPError=> e
		puts "#{final_uri} has fails"
	end

end
