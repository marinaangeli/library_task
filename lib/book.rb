require_relative 'author'

class Book
  attr_accessor :title, :author

  # @@books = []

  def initialize(title, library_name)
    @title = title
    @author_name = choose_author(library_name)
    @library_name = library_name
    # @@books << self
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

  def choose_author(library_name)
    puts "Choose author"
    Author.list_all_authors(library_name)
    index = gets.chomp.to_i - 1
    author = Author.find(index, library_name)
  end
end
