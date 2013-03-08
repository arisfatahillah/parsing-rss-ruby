require "highline/import"
require 'nokogiri'
require 'open-uri'

#method baca xml
def baca_xml
  puts "masukkan nama file xml : "
  my_file = gets.gsub(/[\n\s]/,'')
  puts my_file.inspect
  #myfile = 'resume.xml'
  xml=Nokogiri::XML File.open(my_file)
  xml.xpath('//resource').each { |node| puts " - #{ node['name'] } \n ( #{ node['version'] } )" }
  puts " \n"
  puts " \n"
end

#method baca rss
def baca_rss
 puts "masukkan url dari rss feed : "
 my_url = gets.gsub(/[\n\s]/,'')
 puts my_url.inspect
 
 #contoh url rss feed
 #url = 'http://www.ruby-lang.org/en/feeds/news.rss'
 xml_file = open my_url
 doc = Nokogiri::XML xml_file
 doc.search('item').each do |item|
  puts "========================================================================="
     puts "Item: #{item.at('title').text}"
   puts "Date: #{item.at('pubDate').text}"
   puts "Url: #{item.at('link').text}"
   puts "========================================================================="
   puts " \n"
   puts " \n"
 end
end


puts
loop do
  choose do |menu|
    menu.prompt = "Silahkan pilih menu mas Bro !!! "
    menu.choice(:XML) { baca_xml() }
    menu.choice(:RSS) { baca_rss() }
    menu.choice(:Quit, "Exit program.") { exit }
  end
end
