require_relative 'author'
class Book
  attr_accessor :title, :author

  @@books = []

  def initialize(title)
    @title = title
    @author = choose_author
    @@books << self
  end

  def self.list_books
    @@books.each_with_index do |book, index|
      puts "#{index + 1} - #{book.title}"
    end
  end

  def self.all
    @@books
  end

  def self.find(index)
    @@books[index]
  end

  private

  def choose_author
    puts "Choose author"
    Author.list_authors
    index = gets.chomp.to_i - 1
    Author.find(index)
  end
end


