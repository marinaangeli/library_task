require_relative 'author'
require 'spreadsheet'

class Book
  attr_reader :title, :author_name, :library_file

  def initialize(title, author_name, library_file)
    @title = title
    @author_name = author_name
    @library_file = library_file
  end

  def save
    library = Spreadsheet.open(library_file)
    books_sheet = library.worksheet 'books'
    row_index = books_sheet.last_row_index + 1
    books_sheet.row(row_index).push title, author_name
    library.write library_file
  end

  def self.create(title)
    library_file = Library.choose_library
    author_name = Author.choose_author(library_file)[0]
    book = new(title, author_name, library_file)
    book.save
    puts "#{book.title} by #{author_name} created"
  end

  def self.all(library_file)
    @books = []
    library = Spreadsheet.open(library_file)
    books_sheet = library.worksheet 'books'
    books_sheet.each_with_index(1) do |row, index|
      book_name = row[0]
      author = row[1]
      @books << [book_name, author]
    end
    @books
  end

  def self.list_all_books(books)
    books.each_with_index do |book, index|
      title = book[0]
      author = book[1]
      puts "#{index + 1} - #{title} by #{author}"
    end
  end

  def self.choose_book(library_name)
    books = Book.all(library_name)
    puts "Choose book"
    list_all_books(books)
    index = gets.chomp.to_i - 1
    book = books[index]
    p @book_title = book[0]
  end
end
