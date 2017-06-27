require 'nokogiri'
require 'open-uri'

class Page

  def initialize(web_page)
    doc = Nokogiri::HTML(open(web_page))
    @body = doc.at('body').content
  end

  def print
    puts @body
  end

  def tokenize
    @body = @body.gsub(/\s+/, ";")
  end

end


web_page = "https://github.com/pwener"

page = Page.new(web_page)
page.tokenize
page.print
