require "highline/import"
require 'nokogiri'
require 'open-uri'

class XmlParser
#method baca xml
  def baca_xml(pilihan)
    puts "masukkan nama file xml (lokal) atau link xml dari rss (online) : "
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
   end #tutup do loop
  end # tutup dev

end #tutup class XmlParser

#ciptakan objek baru dari kelas XmlParser
xml1 = XmlParser.new

#ini adalah menu pilihan aplikasi
puts
loop do
  choose do |menu|
    menu.prompt = "Silahkan pilih menu mas Bro !!! "
    menu.choice(:XML) { xml1.baca_xml(1) }
    menu.choice(:RSS) { xml1.baca_xml(2) }
    menu.choice(:Quit, "Exit program.") { exit }
  end
end
