arr = [["teste novo", "reader_name"], ["teste novo", "reader_name4"], ["book1", "reader_name5"], ["book3", "reader_name5"], ["book2", "reader_name"], ["book4", "reader_name5"], ["book1", "reader_name3"], ["teste novo", "reader_name5"]]
simple_arr = arr.map {|a| a[1] }
new_arr = []
unique = simple_arr.uniq

unique.each do |e|
  value = simple_arr.count(e)
  new_arr << [e, value]
end

new_arr.sort_by! {|k,v| v}

new_arr.reverse.first(3).each do |k,v|
  puts "#{k} rented #{v}x"
end

arr = [["teste novo", "reader_name"], ["teste novo", "reader_name4"], ["book1", "reader_name5"], ["book3", "reader_name5"], ["book2", "reader_name"], ["book4", "reader_name5"], ["book1", "reader_name3"], ["teste novo", "reader_name5"]]
simple_arr = arr.map {|a| a[0] }
new_arr = []
unique = simple_arr.uniq

unique.each do |e|
  value = simple_arr.count(e)
  new_arr << [e, value]
end

new_arr.sort_by! {|k,v| v}

new_arr.reverse.first(3).each do |k,v|
  puts "#{k} was read  #{v}x"
end
