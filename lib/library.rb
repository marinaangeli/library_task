require 'csv'
require_relative 'author'

class Library
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def save
    CSV.open("libraries.csv", "a+") do |csv|
      csv << [name]
    end
    puts "Library #{self.name} created"
  end

  def create_author(name, biography)
    author = Author.new(name, biography, self.name)
    author.save
  end

  def list_authors
    Author.list_all_authors(self.name)
  end
end
