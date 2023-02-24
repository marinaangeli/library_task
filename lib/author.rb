require 'csv'

class Author
  attr_accessor :id, :library_name
  attr_reader :author_name, :biography

  # @@authors = []

  def initialize(author_name, biography = nil, library_name)
    @author_name = author_name
    @biography = biography
    @library_name = library_name
    # @@authors << self
  end

  def save
    CSV.open("authors.csv", "a+") do |csv|
      csv << [author_name, biography, library_name]
    end
    puts "#{self.author_name} - #{self.biography} created"
  end

  def self.all(library_name)
    authors = []
    CSV.foreach("authors.csv") do |row|
      authors << Author.new(row[0], row[1], row[2]) if row[2] == library_name
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
