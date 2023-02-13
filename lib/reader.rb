class Reader
  attr_accessor :name, :email, :city, :street, :house

  @@readers = []

  def initialize(name, email, city, street, house)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
    @@readers << self
  end

  def self.list_readers
    @@readers.each_with_index do |reader, index|
      puts "#{index + 1} - #{reader.name}"
    end
  end

  def self.all
    @@readers
  end

  def self.find(index)
    @@readers[index]
  end
end
