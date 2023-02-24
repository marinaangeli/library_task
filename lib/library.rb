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

  def create_author(author_name, biography)
    author = Author.new(author_name, biography, self.library_name)
    author.save
  end

  def list_authors
    Author.list_all_authors(self.library_name)
  end

  def create_book(title)
    book = Book.new(title, self.library_name)
    # author.save
  end
end
