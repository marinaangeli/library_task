require_relative 'lib/library'
require_relative 'lib/author'

marina = Library.new('library_marina')
marina.save
marina.create_author('marina1', 'bio1')
marina.create_author('marina2', 'bio2')
puts "marina list:"
marina.list_authors
p marina.name

ana = Library.new('library_ana')
ana.save
ana.create_author('ana1', 'bio1')
ana.create_author('ana2', 'bio2')
puts "ana list:"
ana.list_authors
p ana.name


# require_relative 'lib/book'
# require_relative 'lib/reader'
# require_relative 'lib/order'

# Author.new("author1", "bio1")
# Author.new("author2", "bio2")

# Book.new("title1")
# Book.new("title2")

# Reader.new("reader1", "email1", 'city1', "street1", "house1")

# Order.new()
