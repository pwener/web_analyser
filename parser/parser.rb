require './auto-visitor'
require './page'

# Inject target subject into specific search engine url
target = ARGV[0]
total_pages = ARGV[1]
# search_engines = Array.new
# search_engines.push("https://duckduckgo.com/?q=#{target}")

# PARAMS
# search?q=
# &num=
# &start=
# url = "http://www.google.com/search?q=#{target}"

pages_parsed = 0
page = 0
begin
	page = page + 1
	linksPerPage = 10
	url = "http://www.google.com/search?q=#{target}&num=#{linksPerPage}&start=#{(linksPerPage)*(page -1)}"
	puts url
	visitor = AutoVisitor.new(url)
	visitor.search_links()

	puts "Found #{visitor.urls.size} urls"

	visitor.urls.each do |url|
	  # URL needs one specific pattern to be valid to the nokogiri
		encoded_url = URI.encode(url)
		final_uri = URI.parse(encoded_url).to_s

		begin
			p = Page.new(final_uri)
			p.printf
		rescue OpenURI::HTTPError, SocketError
			puts "#{final_uri} has failed"
		end
	end


	pages_parsed = pages_parsed + visitor.urls.size
	if pages_parsed >= total_pages.to_i
		break
	end

end while (visitor.urls.size > 0)