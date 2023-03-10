require_relative 'book'
require_relative 'reader'
require 'date'

class Order
  attr_accessor :book, :reader, :date, :library_file

  def initialize(book, reader, date = Date.today, library_file)
    @book = book
    @reader = reader
    @date = date
    @library_file = library_file
  end

  def save
    library = Spreadsheet.open(library_file)
    order_sheet = library.worksheet 'orders'
    row_index = order_sheet.last_row_index + 1
    order_sheet.row(row_index).push book, reader, date
    library.write library_file
  end

  def self.create(date = Date.today)
    library_file = Library.choose_library
    reader = Reader.choose_reader(library_file)
    book = Book.choose_book(library_file)
    order = new(book, reader, date, library_file)
    order.save
    puts "#{order.book} rented by #{reader} on #{date}"
  end


  def self.all(library_file)
    @orders = []
    library = Spreadsheet.open(library_file)
    orders_sheet = library.worksheet 'orders'
    orders_sheet.each_with_index(1) do |row, index|
      book = row[0]
      reader = row[1]
      @orders << [book, reader]
    end
    p @orders
  end

  def self.find(index, library_file)
    orders = all(library_file)
    orders[index]
  end
end
