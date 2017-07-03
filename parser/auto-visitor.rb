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
		http = "http://"

		@doc.search("//cite").each do |url|
			link = url.inner_text
			link = http + link unless link.include? "http"
			@urls.push link
		end
	end

end
