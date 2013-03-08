require "highline/import"
require 'nokogiri'
require 'rss'
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
 
 open(my_url) do |rss|
   feed = RSS::Parser.parse(rss)
   puts "Title: #{feed.channel.title}"
   feed.items.each do |item|
    
	 puts "========================================================================="
     puts "Item: #{item.title}"
	 puts "Date: #{item.pubDate}"
	 puts "Url: #{item.link}"
	 puts "========================================================================="
	 puts " \n"
	 puts " \n"
	
   end
 end
end

begin
  puts
  loop do
    choose do |menu|
      menu.prompt = "Silahkan pilih menu mas Bro !!! "
      menu.choice(:XML) { baca_xml() }
      menu.choice(:RSS) { baca_rss() }
      menu.choice(:Quit, "Exit program.") { exit }
    end
  end
end