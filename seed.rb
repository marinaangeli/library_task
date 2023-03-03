require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'



# marina = Library.new('library_marina')
# marina.save
Library.choose_library


# # Choosing a library
# library = Library.choose_library

# # Creating authors
# n = 1
# 5.times do
#   library.create_author("author_name#{n}", "author_bio#{n}")
#   n += 1
# end

# # # Creating books
# y = 1
# 20.times do
#   library .create_book("book#{y}")
#   y += 1
# end


# # Creating a Readers
# z = 1
# 10.times do
#   library.create_reader("reader_name#{z}","reader_email#{z}", "reader_city#{z}","reader_street#{z}", z)
#   z += 1
# end

# # Creating orders
# 15.times do library.create_order end
