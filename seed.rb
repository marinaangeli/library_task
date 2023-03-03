require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'

# # create library
Library.create('my_library')

# # create authors
10.times do |i|
  Author.create("Author #{i+1}", "Biography #{i+1}")
end

# # # create books
15.times do |i|
  Book.create("Book #{i+1}")
end

# # create readers
10.times do |i|
  Reader.create("Reader #{i+1}", "reader#{i+1}@example.com", "City #{i+1}", "Street #{i+1}", "#{i+1}")
end

# create orders
30.times do
  Order.create
end
