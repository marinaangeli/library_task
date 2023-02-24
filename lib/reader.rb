class Reader
  attr_accessor :reader_name, :email, :city, :street, :house, :library_name

  def initialize(reader_name, email, city, street, house, library_name)
    @reader_name = reader_name
    @email = email
    @city = city
    @street = street
    if house.to_i.positive?
      @house = house
    else
      raise ArgumentError, "House must be positive number"
    end
    @library_name = library_name
  end

  def save
    CSV.open("readers.csv", "a+") do |csv|
      csv << [reader_name, email, city, street, house, library_name]
    end
    puts "Reader: #{self.reader_name} created"
  end

  def self.all(library_name)
    readers = []
    CSV.foreach("readers.csv") do |row|
      readers << Reader.new(row[0], row[1], row[2], row[3], row[4], row[5]) if row[5] == library_name
    end
    readers
  end

  def self.list_all_readers(library_name)
    readers = all(library_name)
    readers.each_with_index do |reader, index|
      puts "#{index + 1} - #{reader.reader_name}"
    end
  end

  def self.find(index, library_name)
    readers = all(library_name)
    readers[index]
  end
end
