require_relative 'lib/library'
require_relative 'lib/author'
require_relative 'lib/book'
require_relative 'lib/reader'
require_relative 'lib/order'



# Creating a Library:
Library.create('Library Name')

# Creating an author
Author.create("Author Name", "Biography")

# Creating a book
Book.create("Book Title")

# Creating a Reader
Reader.create("Reader Name","Email", "City","Street", 100)

# Creating an order
Order.create

# List top n readers
library.list_top_readers(4)

# List top n books
library.list_top_books(5)

# List count of readers of n top books
library.top_books_renters(4)
