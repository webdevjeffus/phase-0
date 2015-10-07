def mode(array)

  out_array = []
  mode_hash = Hash.new(0)

  array.each do | item |
    mode_hash[item] += 1
  end

  #highest = 0
  #mode_hash.each do |key, value|
  #  if value >= highest
  #    highest = value
  #  end
  #end

  highest_pair = mode_hash.max_by { |k,v| v }
  highest = highest_pair[0]

  #mode_hash.each do |key, value|
  #  if value == highest
  #    out_array << key
  #  end
  #end

  #return out_array
  return highest

end


puts mode([1,1,1,1,3,3,3,5,5,6,7,8,9,1,1])

