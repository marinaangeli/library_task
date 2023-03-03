class Reader
  attr_accessor :reader_name, :email, :city, :street, :house, :library_name

  def initialize(reader_name, email, city, street, house, library_file)
    @reader_name = reader_name
    @email = email
    @city = city
    @street = street
    if house.to_i.positive?
      @house = house
    else
      raise ArgumentError, "House must be positive number"
    end
    @library_file = library_file
  end

  def save
    library = Spreadsheet.open(@library_file)
    readers_sheet = library.worksheet 'readers'
    row_index = readers_sheet.last_row_index + 1
    readers_sheet.row(row_index).push reader_name, email, city, street, house
    library.write @library_file
    # I don't know why it was only working with @library_file for reader, and for the other it was ok
  end

  def self.create(reader_name, email, city, street, house)
    library_file = Library.choose_library
    reader = new(reader_name, email, city, street, house, library_file)
    reader.save
    puts "#{reader_name.capitalize} created"
  end

  def self.all(library_file)
    @readers = []
    library = Spreadsheet.open(library_file)
    readers_sheet = library.worksheet 'readers'
    readers_sheet.each_with_index(1) do |row, index|
      reader_name = row[0]
      @readers << reader_name
    end
    @readers
  end

  def self.list_all_readers(readers)
    readers.each_with_index do |reader, index|
      puts "#{index + 1} - #{reader}"
    end
  end

  def self.choose_reader(library_file)
    readers = all(library_file)
    puts "Choose reader number"
    list_all_readers(readers)
    index = gets.chomp.to_i - 1
    @reader = readers[index]
  end
end
