require 'nokogiri'

class XMLParser
  attr_reader :xml

  def initialize(xml)
    @xml = xml
  end

  def parse
    doc = Nokogiri::XML xml
    doc.search('item').map do |item|
      new_item = {}
      new_item[:title] = item.at('title').text
      new_item[:date] = item.at('pubDate').text
      new_item[:link] = item.at('link').text
      new_item
    end
  end
end