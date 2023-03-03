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
    # CSV.open("storage/authors.csv", "a+") do |csv|
    #   csv << [author_name, biography, library_name]
    # end
    # puts "#{self.author_name} - #{self.biography} created"
  end

  def self.create(author_name, library_file, biography = nil)
    author = new(author_name, library_file, biography)
    author.save
  end

  def self.all(library_file)
    @authors = []
    library = Spreadsheet.open(library_file)
    authors_sheet = library.worksheet 'authors'
    authors_sheet.each_with_index(1) do |row, index|
      author_name = row[0]
      @authors << author_name
    end
    @authors
  end

  def self.list_all_authors(library_file)
    authors = all(library_file)
    authors.each_with_index do |author, index|
      puts "#{index + 1} - #{author}"
    end
  end

  def self.find(index, library_file)
    authors = all(library_file)
    p authors[index]
  end
end
