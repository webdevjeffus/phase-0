#I also want to create a sorting method that arranges the data in my hash by age (starting with the youngest first). I want to see what happens when I do this, but I don't want it to modify the existing data.

def my_hash_sorting_method(source)

# Create hash to store item-frequency pairs, sets initial value for keys to 0
  # mode_hash = Hash.new(0)

  # Compute frequency of each item in array, stores in hash
  # array.each { | item | mode_hash[item] += 1 }

  # Return array containing keys selected because their value equals the max value
  # source.select{ |k,v| v == mode_hash.values.max}.keys

  source.sort_by{ |k,v| v}.to_h


end





i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

p my_family_pets_ages
p my_hash_sorting_method(my_family_pets_ages)