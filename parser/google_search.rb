require 'open-uri'
require 'nokogiri'

page = open "http://www.google.com/search?num=100&q=stackoverflow"
html = Nokogiri::HTML page

html.search("cite").each do |cite|
  puts cite.inner_text
end
