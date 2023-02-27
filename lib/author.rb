require 'csv'

class Author
  attr_accessor :library_name
  attr_reader :author_name, :biography

  def initialize(author_name, library_name, biography = nil)
    @author_name = author_name
    @library_name = library_name
    @biography = biography
  end

  def save
    CSV.open("storage/authors.csv", "a+") do |csv|
      csv << [author_name, biography, library_name]
    end
    puts "#{self.author_name} - #{self.biography} created"
  end

  def self.all(library_name)
    authors = []
    CSV.foreach("storage/authors.csv") do |row|
      author_name = row[0]
      library = row[1]
      biography = row[2]
      authors << Author.new(author_name, library, biography) if library == library_name
    end
    authors
  end

  def self.list_all_authors(library_name)
    authors = all(library_name)
    authors.each_with_index do |author, index|
      puts "#{index + 1} - #{author.author_name}"
    end
  end

  def self.find(index, library_name)
    authors = all(library_name)
    authors[index]
  end

end
