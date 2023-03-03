require 'spreadsheet'
require_relative 'lib/library.rb'
require_relative 'lib/author.rb'

# Library.create("library_2")
# Library.create("library_3")
# sheet1 = book.create_worksheet
# sheet2 = book.create_worksheet :name => 'My Second Worksheet'
# sheet1.name = 'My First Worksheet'
# sheet1.row(0).concat %w{Name Country Acknowlegement}
# sheet1[1,0] = 'Japan'
# row = sheet1.row(1)
# row.push 'Creator of Ruby'
# row.unshift 'Yukihiro Matsumoto'
# sheet1.row(2).replace [ 'Daniel J. Berger', 'U.S.A.',
#                         'Author of original code for Spreadsheet::Excel' ]
# sheet1.row(3).push 'Charles Lowe', 'Author of the ruby-ole Library'
# sheet1.row(3).insert 1, 'Unknown'
# sheet1.update_row 4, 'Hannes Wyss', 'Switzerland', 'Author'
# book.write 'excel-file.xls'
# library = Library.choose_library
# Author.choose_author(library)
# Author.find(1, library)

# book = Spreadsheet.open 'excel-file.xls'
# sheet = book.worksheet 'My First Worksheet'
# sheet.name = 'authors'
# sheet.each do |row|
#   puts "#{row[0]} - #{row[1]} - #{row[2]}"
# end
# row_index = sheet.last_row_index + 1
# p row_index.class
# name = "name"
# country = "country"
# acknowledgement = "cool"
# sheet.row(row_index).replace [name, country, acknowledgement]
# book.write 'excel-file.xls'
library = Library.choose_library
Book.choose_book(library)
