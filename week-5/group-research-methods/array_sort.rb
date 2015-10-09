# Person 3



def my_array_sorting_method(source)
  source = source.partition{ |item| item.is_a? Integer }
  source[0] = source[0].sort
  source[1] = source[1].sort
  source.flatten
end


def my_array_sorting_method(source)
  source.sort_by{ |x| x.to_s.downcase }
end

def my_array_sorting_method!(source)
  source.sort_by!{ |x| x.to_s }
end



i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
# i_want_pets = ["I", "want", "pets", "but", "only", "have"]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

p i_want_pets.object_id
p new_array = my_array_sorting_method(i_want_pets)
p new_array.object_id
p i_want_pets.object_id
# $ my_array_sorting_method(i_want_pets)
# => [2, 3, "I", "but", "have", "only", "pets", "want"]