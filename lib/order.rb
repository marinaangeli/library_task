require_relative 'book'
require_relative 'reader'
require 'date'

class Order
  attr_accessor :book, :reader, :date, :library_name

  def initialize(book, reader, date = Date.today, library_name)
    @book = book
    @reader = reader
    @date = date
    @library_name = library_name
  end

  def save
    CSV.open("storage/orders.csv", "a+") do |csv|
      csv << [book, reader, date, library_name]
    end
    puts "Order placed: #{self.book} rented by #{self.reader} at #{self.date}"
  end


  def self.all(library_name)
    orders = []
    CSV.foreach("storage/orders.csv") do |row|
      orders << [row[0], row[1]] if row[3] == library_name
    end
    orders
  end

  def self.find(index, library_name)
    orders = all(library_name)
    orders[index]
  end

  def self.choose_book(library_name)
    puts "Choose book"
    Book.list_all_books(library_name)
    index = gets.chomp.to_i - 1
    book = Book.find(index, library_name)
    book.title
  end

  def self.choose_reader(library_name)
    puts "Choose reader"
    Reader.list_all_readers(library_name)
    index = gets.chomp.to_i - 1
    reader = Reader.find(index, library_name)
    reader.reader_name
  end
end
