require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'

marina = Library.new('library_marina')
marina.save
marina.create_author('author_marina1', 'author_marina1bio1')
marina.create_author('author_marina2', 'author_marina2bio2')
book = marina.create_book("livro 1")
p book
# ana = Library.new('library_ana')
# ana.save
# ana.create_author('author_ana1', 'author_ana1bio1')
# ana.create_author('author_ana2', 'author_ana2bio2')
# puts "ana list:"
# ana.list_authors
# p ana.library_name
