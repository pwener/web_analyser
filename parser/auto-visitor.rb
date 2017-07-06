require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'
require './page'

class AutoVisitor
	attr_reader :urls
	@doc
	@urls

	def initialize(web_site)
		

		#search_page = open web_site
		search_page = open(web_site, :allow_redirections => :safe)


		@doc = Nokogiri::HTML(search_page)
		@urls = Array.new
	end

	def search_links
		http = "http://"

		@doc.search("//cite").each do |url|
			link = url.inner_text
			puts link
			link = http + link unless link.include? "http"
			@urls.push link
		end
	end

end
