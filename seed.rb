require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'

Author.new("author1", "bio1")
Author.new("author2", "bio2")

Book.new("title1")
Book.new("title2")

Reader.new("reader1", "email1", 'city1', "street1", "house1")

Order.new()
