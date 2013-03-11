class XMLPrinter
  attr_reader :records

  def initialize(records)
    @records = records
  end

  def run
    records.each do |record|
      print record
    end
  end

  def print(record)
    puts "===================================================================="
    puts "Title: #{record[:title]}"
    puts "Date: #{record[:date]}"
    puts "Url: #{record[:link]}"
    puts "===================================================================="
    puts " \n"
    puts " \n"
  end
end