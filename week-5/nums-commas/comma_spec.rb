require_relative "my_solution"
#=> Make sure you change this to the name of your code file! Save that file
# into this repo.


def random_num(min, max)
   rand(max - min + 1) + min
end

describe "separate_comma" do
   it "returns no comma, when the integer is smaller than 1000" do
      expect(separate_comma(random_num(0, 999))).to match /^\d{1,3}$/
   end
   it "returns one comma, when the integer is between 1000 and 9999" do
      expect(separate_comma(random_num(1000, 9999))).to match /^\d{1},\d{3}$/
   end
   it "returns one comma, when the integer is between 10000 and 99999" do
      expect(separate_comma(random_num(10000, 99999))).to match /^\d{2},\d{3}$/
   end
   it "returns one comma, when the integer is between 100000 and 999999" do
      expect(separate_comma(random_num(100000, 999999))).to match /^\d{3},\d{3}$/
   end
   it "returns two commas, when the integer is between 1000000 and 9999999" do
      expect(separate_comma(random_num(1000000, 9999999))).to match /^\d{1},\d{3},\d{3}$/
   end
   it "returns two commas, when the integer is between 10000000 and 99999999" do
      expect(separate_comma(random_num(10000000, 99999999))).to match /^\d{2},\d{3},\d{3}$/
   end
end