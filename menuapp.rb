require "highline/import"
require "./xml_parser"
require "./xml_printer"
require 'open-uri'

#ini adalah menu pilihan aplikasi
puts
loop do
  choose do |menu|
    menu.prompt = "Silahkan pilih menu mas Bro !!! "
    menu.choice(:XML) do 
      puts "masukkan nama file xml: "
      input = gets.gsub(/[\n\s]/,'')
      parser = XMLParser.new File.open input
      XMLPrinter.new(parser.parse).run
    end
    menu.choice(:RSS) do
      puts "masukkan nama link xml dari rss (online): "
      input = gets.gsub(/[\n\s]/,'')
      parser = XMLParser.new open input
      XMLPrinter.new(parser.parse).run
    end
    menu.choice(:Quit, "Exit program.") { exit }
  end
end
