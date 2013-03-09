require "highline/import"
require 'nokogiri'
require 'open-uri'

#method baca xml
def baca_xml(pilihan)
  puts "masukkan nama file xml : "
  my_file = gets.gsub(/[\n\s]/,'')
  puts my_file.inspect
  
  xml_file = open my_file
  #ini adalah instance variable
  @pilihan = pilihan
  
  #myfile = 'resume.xml'
  #contoh url rss feed
  #url = 'http://www.ruby-lang.org/en/feeds/news.rss'
  
  if pilihan == 1
    doc = Nokogiri::XML File.open(my_file)
  elsif pilihan == 2
    doc = Nokogiri::XML xml_file
  end   
     
  doc.search('item').each do |item|
    puts "===================================================================="
    puts "Title: #{item.at('title').text}"
    puts "Date: #{item.at('pubDate').text}"
    puts "Url: #{item.at('link').text}"
    puts "===================================================================="
    puts " \n"
    puts " \n"
  end
end

#ini adalah menu pilihan aplikasi
puts
loop do
  choose do |menu|
    menu.prompt = "Silahkan pilih menu mas Bro !!! "
    menu.choice(:XML) { baca_xml(1) }
    menu.choice(:RSS) { baca_xml(2) }
    menu.choice(:Quit, "Exit program.") { exit }
  end
end
