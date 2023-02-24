require_relative 'author'

class Book
  attr_accessor :title, :author_name, :library_name

  def initialize(title, author, library_name)
    @title = title
    @author_name = author
    @library_name = library_name
  end

  def save
    CSV.open("books.csv", "a+") do |csv|
      csv << [title, author_name, library_name]
    end
    puts "#{self.title} by #{self.author_name} at #{self.library_name} library created"
  end


  def self.all(library_name)
    books = []
    CSV.foreach("books.csv") do |row|
      books << Book.new(row[0], row[1], row[2]) if row[2] == library_name
    end
    books
  end

  def self.list_all_books(library_name)
    books = Book.all(library_name)
    books.each_with_index do |book, index|
      puts "#{index + 1} - #{book.title} - #{book.author_name}"
    end
  end

  def self.find(index, library_name)
    books = all(library_name)
    books[index]
  end

  def self.choose_author(library_name)
    puts "Choose author"
    Author.list_all_authors(library_name)
    index = gets.chomp.to_i - 1
    author = Author.find(index, library_name)
    author.author_name
  end
end
