require 'spreadsheet'
require_relative 'author'
require_relative 'reader'
require_relative 'order'

class Library
  attr_reader :library_name

  def initialize(library_name)
    @library_name = library_name
  end

  def save
    library_file = Spreadsheet::Workbook.new
    authors = library_file.create_worksheet :name => 'authors'
    authors.row(0).concat %w{author_name biography}
    books = library_file.create_worksheet :name => 'books'
    books.row(0).concat %w{book_title}
    readers = library_file.create_worksheet :name => 'readers'
    readers.row(0).concat %w{reader_name email city street house}
    orders = library_file.create_worksheet :name => 'orders'
    orders.row(0).concat %w{book reader date}
    file_path = "storage/#{library_name}.xls"
    library_file.write file_path
  end

  def self.create(library_name)
    library = new(library_name)
    library.save
  end

  def self.choose_library
    libraries = []
    directory_path = "storage"
    Dir.glob(File.join(directory_path, "*.xls")).each do |file_path|
      library_name = File.basename(file_path, ".xls")
      libraries << library_name
    end
    puts "Enter the number of the library you want to select:"
    libraries.each_with_index do |library, index|
      puts "#{index + 1} - #{library}"
    end
    index = gets.chomp.to_i - 1
    selected_library = libraries[index]
    @library_file = File.join(directory_path, "#{selected_library}.xls")
  end

  def self.list_top_books(n, print=true)
    library_file = choose_library
    # Passes 0 to only retrieve the book title
    books = retrieve_top(0, library_file)
    @top_books = books.first(n)
    @top_books.each do |book,value|
      puts "The book '#{book}' was rented #{value}x" if print
    end
  end

  def self.list_top_readers(n)
    library_file = choose_library
    # Passes 1 to only retrieve the book title and reader name
    readers = retrieve_top(1, library_file)
    readers.first(n).each do |reader, orders|
      puts "The reader '#{reader}' ordered #{orders}x"
    end
  end

  def self.top_books_renters(n=3)
    list_top_books(n, false)
    selected_orders = @all_orders.select do |order|
      @top_books.flatten.include?(order[0])
    end
    selected_readers = selected_orders.map { |order| order[1] }
    puts "#{selected_readers.uniq.count} unique readers ordered top #{n} books"
  end

  def self.retrieve_top(y, library_file)
    @all_orders = Order.all(library_file)
    simple_arr = @all_orders.map {|a| a[y] }
    new_arr = []
    unique = simple_arr.uniq
    unique.each do |e|
      value = simple_arr.count(e)
      new_arr << [e, value]
    end
    @new_arr = new_arr.sort_by {|k,v| v}.reverse!
  end
end
