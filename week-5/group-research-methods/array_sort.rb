# Person 3



def my_array_sorting_method(source)
  p source
  sorted = source.each{ |item| item.to_s }
  p source
  p sorted


end




i_want_pets = ["I", "want", 3, "pets", "but", "only", "have", 2]
my_family_pets_ages = {"Evi" => 6, "Ditto" => 3, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0}

my_array_sorting_method(i_want_pets)

# $ my_array_sorting_method(i_want_pets)
# => [2, 3, "I", "but", "have", "only", "pets", "want"]