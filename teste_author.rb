require 'spreadsheet'
require_relative 'lib/library.rb'
require_relative 'lib/author.rb'
require_relative 'lib/reader.rb'

# Library.create("library_2")
# Library.create("library_3")

# Reader.create("reader_nameA","reader_email", "reader_city","reader_street", 100)
# library = Library.choose_library
# Order.all(library)
Library.top_books_renters
