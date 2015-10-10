# i = -4 version
=begin
def insert_commas(int)

  string = int.to_s

  i = -4

  until i <= 0 - (string.length + 1)

    puts string
    puts "i = " + i.to_s

    string = string.insert(i,",")

    puts string

    i -= 4

    puts "---------"
  end

  return string

end
=end
# =====================================

# i = 0 version
=begin
def insert_commas(positive_int)

  string = positive_int.to_s

  i = 0

  until i  > string.length / 4

    if i > 0
      string = string.insert( i * -4,",")
    end

    i += 1

  end

  return string

end
=end

# =====================================

# reverse slice version

def insert_commas(positive_int)

  string = positive_int.to_s.reverse
  int_array = []

  while string.length > 0 do int_array << string.slice!(0,3) end

  int_array.join(",").reverse

end


# =====================================

# one-line version

def insert_commas(positive_int)
  positive_int.to_s.reverse.chars.each_slice(3).map{|s| s.join}#.join(",").reverse
end



#p insert_commas(0)
#p "===================="
#p insert_commas(10)
#p "===================="
#p insert_commas(100)
#p "===================="
p insert_commas(1000)
#p "===================="
#p insert_commas(10000)
#p "===================="
#p insert_commas(100000)
#p "===================="
#p insert_commas(1000000)
#p "===================="
#p insert_commas(1000000000000)


"abcdefghijklmnopqrstuvwxyz".chars.to_a.each_slice(3).to_a.map {|s| s.to_s }