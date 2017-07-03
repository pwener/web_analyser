require './auto-visitor'
require './page'

# Inject target subject into specific search engine url
target = ARGV[0]

# search_engines = Array.new
# search_engines.push("https://duckduckgo.com/?q=#{target}")
url = "http://www.google.com/search?q=#{target}"

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
		puts "#{final_uri} has fails"
	end

end
