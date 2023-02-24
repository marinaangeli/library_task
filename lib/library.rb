require 'csv'
require_relative 'author'

class Library
  attr_accessor :library_name

  def initialize(library_name)
    @library_name = library_name
  end

  def save
    CSV.open("libraries.csv", "a+") do |csv|
      csv << [library_name]
    end
    puts "Library #{self.library_name} created"
  end

  def self.choose_library
    libraries = []
    CSV.foreach("libraries.csv") do |row|
      libraries << Library.new(row[0])
    end
    libraries.each_with_index do |library, index|
      puts "#{index + 1} - #{library.library_name}"
    end
    index = gets.chomp.to_i - 1
    library = libraries[index]
  end

  def create_author(author_name, biography)
    author = Author.new(author_name, biography, self.library_name)
    author.save
  end

  def list_authors
    Author.list_all_authors(self.library_name)
  end

  def create_book(title)
    author = Book.choose_author(self.library_name)
    book = Book.new(title, author, self.library_name)
    book.save
  end

  def list_books
    Book.list_all_books(self.library_name)
  end
end
