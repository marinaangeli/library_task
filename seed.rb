require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'


# marina = Library.new('library_marina')
# marina.save
# marina.create_author('author_marina1', 'author_marina1bio1')
# marina.create_author('author_marina2', 'author_marina2bio2')

# ana = Library.new('library_ana')
# ana.save

# ana.create_author('author_ana2', 'author_ana2bio2')
# puts "ana list:"
# ana.list_authors
# p ana.library_name


puts "escolhendo biblioteca"
lista = Library.choose_library
# puts "biblioteca escolhida: #{lista.library_name}"
# # n = 1
# # 3.times do
# #   lista.create_author("author_ana#{n}", "author_ana1bio#{n}")
# #   n += 1
# # end

# # y = 1
# # 10.times do
# #   lista .create_book("book#{y}")
# #   y += 1
# # end
# # puts "listando livros"
# # lista.list_books
# # lista.create_reader("reader_name", 'email', 'city', 'street', 50)

# y = 1
# 5.times do
#   lista.create_reader("reader_name#{y}","reader_email#{y}", "reader_city#{y}","reader_street#{y}", y)
#   y += 1
# end

# 7.times do lista.create_order end
lista.list_top_books(2)
lista.list_top_readers(3)
