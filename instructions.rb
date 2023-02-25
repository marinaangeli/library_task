require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'



# Creating a Library:
marina = Library.new('library_marina')
marina.save


# Choosing a library
library = Library.choose_library

# Creating an author
lista.create_author("author_name", "author_bio")

# Creating a book
lista .create_book("book")

# Creating a Reader
lista.create_reader("reader_name","reader_email", "reader_city","reader_street", 100)


# Creating an order
lista.create_order

# List top n readers
library.list_top_readers(4)

# List top n books
library.list_top_books(5)

# List count of readers of n top books
library.top_books_renters(4)
