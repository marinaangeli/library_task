require 'spreadsheet'

class Author
  attr_accessor :library_file, :author_name, :biography

  def initialize(author_name, library_file, biography = nil)
    @author_name = author_name
    @library_file = library_file
    @biography = biography
  end

  def save
    library = Spreadsheet.open(library_file)
    authors_sheet = library.worksheet 'authors'
    row_index = authors_sheet.last_row_index + 1
    authors_sheet.row(row_index).push author_name, biography
    library.write library_file
  end

  def self.create(author_name, biography = nil)
    library_file = Library.choose_library
    author = new(author_name, library_file, biography)
    author.save
    puts "#{author_name} - #{biography} created"
  end

  def self.alls(library_file)
    @authors = []
    library = Spreadsheet.open(library_file)
    authors_sheet = library.worksheet 'authors'
    authors_sheet.each_with_index(1) do |row, index|
      author_name = row[0]
      @authors << author_name
    end
    @authors
  end

  def self.list_all_authors(authors)
    authors.each_with_index do |author, index|
      name = author[0]
      bio = author[1]
      puts "#{index + 1} - #{name} by #{bio}"
    end
  end

  def self.choose_author(library_file)
    authors = all(library_file)
    puts "Choose author number"
    list_all_authors(books)
    index = gets.chomp.to_i - 1
    @author = authors[index]
  end
end
