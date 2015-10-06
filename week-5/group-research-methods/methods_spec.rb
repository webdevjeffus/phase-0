require_relative "my_solution"

# PERSON 1: FIND MATCHING DATA
describe 'PERSON 1: my_array_finding_method' do
  let(:i_want_pets) {["I", "want", 3, "pets", "but", "only", "have", 2 ]}

  it "selects all words with a 't' in the original order" do
    expect(my_array_finding_method(i_want_pets, "t")).to eq ["want","pets","but"]
  end

  it "selects all words with an 'a' in the original order" do
    expect(my_array_finding_method(i_want_pets, "a")).to eq ["want","have"]
  end

end

describe 'PERSON 1: my_hash_finding_method' do

  let(:my_family_pets_ages) {{"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3}}

  it "returns all names of pets who are 3 years old" do
    expect(my_hash_finding_method(my_family_pets_ages, 3)).to eq ["Hoobie", "Ditto"]
  end

  it "returns all names of pets who are less than one year old" do
    expect(my_hash_finding_method(my_family_pets_ages, 0)).to eq ["Annabelle"]
  end
end

# PERSON 2: MODIFY EXISTING DATA
describe 'PERSON 2: my_array_modification_method!' do
  let(:i_want_pets) {["I", "want", 3, "pets", "but", "only", "have", 2 ]}

  it "adds one to any integer in the array" do
    expect(my_array_modification_method!(i_want_pets, 1)).to eq ["I", "want", 4, "pets", "but", "only", "have", 3 ]
  end

  it "operates destructively by altering the original array" do
     expect(my_array_modification_method!(i_want_pets, 1).object_id).to eq(i_want_pets.object_id)
  end

end

describe 'PERSON 2: my_hash_modification_method!' do

  let(:my_family_pets_ages) {{"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3}}

  it "adds a specified number of years to any integer in the hash" do
    expect(my_hash_modification_method!(my_family_pets_ages, 2)).to eq({"Evi" => 8, "Hoobie" => 5, "George" => 14, "Bogart" => 6, "Poly" => 6, "Annabelle" => 2, "Ditto" => 5})
  end

  it "operates destructively by altering the original hash" do
     expect(my_hash_modification_method!(my_family_pets_ages, 2).object_id).to eq(my_family_pets_ages.object_id)
  end

end

# PERSON 3: SORT DATA
describe 'PERSON 3: my_array_sorting_method!' do
  let(:i_want_pets) { ["I", "want", 3, "pets", "but", "only", "have", 2 ] }

  it "converts sorts all elements alphabetically without altering changing data" do
    expect(my_array_sorting_method(i_want_pets)).to eq [2, 3, "I", "but", "have", "only", "pets", "want"]
  end

  it "operates non-destructively" do
     expect(my_array_sorting_method(i_want_pets).object_id).to_not eq(i_want_pets.object_id)
  end

end

describe 'PERSON 3: my_hash_sorting_method!' do
  let(:my_family_pets_ages) {{"Evi" => 6, "Ditto" => 2, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 5, "Annabelle" => 0}}

  it "returns an array that orders each animal first based on age (youngest to oldest)" do
    expect(my_hash_sorting_method(my_family_pets_ages)).to eq([["Annabelle", 0], ["Ditto", 2], ["Hoobie", 3], ["Bogart", 4], ["Poly", 5], ["Evi", 6], ["George", 12]])
  end

  it "operates non-destructively" do
     expect(my_hash_sorting_method(my_family_pets_ages).object_id).to_not eq(my_family_pets_ages.object_id)
  end

end

# PERSON 4: DELETE MATCHING DATA
describe 'PERSON 4: my_array_deletion_method!' do
  let(:i_want_pets) { ["I", "want", 3, "pets", "but", "only", "have", 2 ] }
  it "deletes all words that contain an 'a'" do
    expect(my_array_deletion_method!(i_want_pets, "a")).to eq ["I", 3, "pets", "but", "only", 2 ]
  end

  it "operates destructively" do
     expect(my_array_deletion_method!(i_want_pets, "o").object_id).to eq(i_want_pets.object_id)
  end

end

describe 'PERSON 4: my_hash_deletion_method!' do

  let(:my_family_pets_ages) {{"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3}}

  it "deletes an animal based on name" do
    expect(my_hash_deletion_method!(my_family_pets_ages, "George")).to eq({"Evi" => 6, "Hoobie" => 3, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3})
  end

  it "operates destructively" do
     expect(my_hash_deletion_method!(my_family_pets_ages, "George").object_id).to eq(my_family_pets_ages.object_id)
  end

end

# PERSON 5: SPLIT DATA
describe 'PERSON 5: my_array_splitting_method' do
  let(:i_want_pets) { ["I", "want", 3, "pets", "but", "only", "have", 2 ] }

  it "successfully splits elements of an array into two separate arrays based on whether the element is an integer" do
    expect(my_array_splitting_method(i_want_pets)).to eq [[3,2], ["I", "want","pets", "but", "only", "have"]]
  end

  it "operates non-destructively" do
     expect(my_array_splitting_method(i_want_pets).object_id).to_not eq(i_want_pets.object_id)
  end

end

describe 'PERSON 5: my_hash_splitting_method' do
  let(:my_family_pets_ages) {{"Evi" => 6, "Hoobie" => 3, "George" => 12, "Bogart" => 4, "Poly" => 4, "Annabelle" => 0, "Ditto" => 3}}

  it "splits a hash into nested arrays based on the age of the pet's age" do
    expect(my_hash_splitting_method(my_family_pets_ages, 5)).to eq ([[["Hoobie", 3], ["Bogart", 4], ["Poly", 4], ["Annabelle", 0], ["Ditto", 3]], [["Evi", 6], ["George", 12]]])
  end

  it "operates non-destructively" do
     expect(my_hash_splitting_method(my_family_pets_ages, 5).object_id).to_not eq(my_family_pets_ages.object_id)
  end

end