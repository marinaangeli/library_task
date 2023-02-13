require_relative 'book'
require_relative 'reader'
require 'date'

class Order
  attr_accessor :book, :reader, :date

  def initialize(date = Date.today)
    @book = choose_book
    @reader = choose_reader
    @date = date
  end

  private

  def choose_book
    puts "Choose book"
    Book.list_books
    index = gets.chomp.to_i - 1
    Book.find(index)
  end

  def choose_reader
    puts "Choose reader"
    Reader.list_readers
    index = gets.chomp.to_i - 1
    Reader.find(index)
  end
end
