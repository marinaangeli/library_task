class Author
  attr_accessor :name, :biography

  @@authors = []

  def initialize(name, biography = nil)
    @name = name
    @biography = biography
    @@authors << self
  end

  def self.list_authors
    @@authors.each_with_index do |author, index|
      puts "#{index + 1} - #{author.name}"
    end
  end

  def self.all
    @@authors
  end

  def self.find(index)
    @@authors[index]
  end
end


