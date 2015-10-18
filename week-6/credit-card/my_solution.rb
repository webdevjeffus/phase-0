# Class Warfare, Validate a Credit Card Number


# I worked on this challenge [by myself, with: ].
# I spent [#] hours on this challenge.

=begin
For this challenge, you will need to break down the algorithm into the following steps. You will probably want to break these down into individual methods that are called when you run the #check_card method.

Starting with the second to last digit, double every other digit until you reach the first digit.

Sum all the untouched digits and the doubled digits (doubled digits need to be broken apart, 10 becomes 1 + 0).

If the total is a multiple of ten, you have received a valid credit card number!

Example given 4563 9601 2200 1999
Origin: 4   5   6   3   9   6   0   1   2   2   0   0   1   9   9   9
Step 1: 8   5  12   3  18   6   0   1   4   2   0   0   2   9  18   9
Step 2: 8 + 5 + 1 + 2 + 3 + 1 + 8 + 6 + 0 + 1 + 4 + 2 + 0 + 0 +2+ 9 + 1 + 8 + 9
Step 3: 70 (total above) % 10 == 0
Step 4: Profit
Your class will need to return true or false when you call the #check_card method. Your class needs to be initialized with a credit card number that is exactly 16 digits -- otherwise you should receive an ArgumentError.
=end


# Pseudocode

# Input: 16-digit credit card number
# Output: boolean value based on whether the card number is valid
# Steps:

=begin
INITIALIZE(card_number)
  RAISE ERROR if card_number is more than 16-digits long
  SET instance variable @card_num = card_number

PREPARE NUMBER
  SPLIT card_num into array of 16 elements
  REVERSE the sequence of the array

DOUBLE DIGITS
  DOUBLE every even-numbered digit
  FOR EACH element in array
  CHECK for values >= 10
    IF value >= 10, split into array and add elements

CHECK SUM
  SUM all the digits
  IF sum modulus 10 equals 0, return true
  ELSE return false


CHECK_CARD
  PREPARE NUMBER
  DOUBLE DIGITS
  CHECK SUM
=end

# Initial Solution

# Don't forget to check on initialization for a card length
# of exactly 16 digits

class CreditCard

  attr_reader :card_num

  def initialize(card_num)
    if card_num.to_s.length != 16
      raise ArgumentError, "Valid numbers must be 16 digits long."
    end
    @card_num = card_num
  end


  def prepare_number
    @card_num = @card_num.to_s.split(//).reverse
    @card_num.each_index do |i|
      @card_num[i] = @card_num[i].to_i
    end
  end


  def double_digits
   @card_num.each_index do |i|
     if i.odd?
       @card_num[i] += @card_num[i]
     end
     if @card_num[i] >= 10
       @card_num[i] = @card_num[i].to_s.split(//)
       @card_num[i][0] = @card_num[i][0].to_i
       @card_num[i][1] = @card_num[i][1].to_i
       @card_num[i] = @card_num[i][0] + @card_num[i][1]
     end
   end
  end


  def check_sum
    return true if @card_num = @card_num.map.reduce(:+) % 10 == 0
    return false
  end


  def check_card
    prepare_number
    double_digits
    check_sum
  end

end


# card = CreditCard.new(4408041234567901)
#
# p card
# p card.check_card


# Refactored Solution

class CreditCard

  attr_reader :card_num

  def initialize(card_num)
    unless card_num.to_s.length == 16
      raise ArgumentError, "Valid numbers must be 16 digits long."
    end
    @card_num = card_num
  end


  def sum_digits(array)
    array = array.map.reduce(:+)
  end


  def check_sum
    sum_digits(@card_num) % 10 == 0 ? true : false
  end


  def digits_to_int(array)
    array.each_index { |i| array[i] = array[i].to_i }
  end


  def prepare_number
    @card_num = @card_num.to_s.split(//).reverse
    digits_to_int(@card_num)
  end


  def double_digits
   @card_num.each_index do |i|
     @card_num[i] += @card_num[i] if i.odd?
     if @card_num[i] >= 10
       @card_num[i] = @card_num[i].to_s.split(//)
       digits_to_int(@card_num[i])
       @card_num[i] = sum_digits(@card_num[i])
     end
   end
  end


  def check_card
    prepare_number
    double_digits
    check_sum
  end


end


card = CreditCard.new(4408041234567901)

p card
p card.check_card







# Reflection