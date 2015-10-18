# Challenge 6.7 - Validate a Credit Card Number
# By Jeff George and Armani Saldana
# 10/18/15 for DBC Phase 0

# We spent 1.75 hours coding for this challenge.
# I spent 1.75 hours reflecting on this challenge, and doing some fine-tuning
#     to the refactored solution.


# Pseudocode ==================================================================

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

# Driver code for Initial Solution --------------------------------------------

# card = CreditCard.new(4408041234567901)
#
# p card
# p card.check_card


# Refactored Solution =========================================================

class CreditCard

  def initialize(card_num)
    unless card_num.to_s.length == 16
      raise ArgumentError, "Valid numbers must be 16 digits long."
    end
    @card_num = card_num
  end


# Helper Methods ------------------------------------------

  def digits_to_int(array)
    array.each_index { |i| array[i] = array[i].to_i }
  end


  def sum_digits(array)
    array = array.reduce(:+)
  end


  def valid_num?
    sum_digits(@card_num) % 10 == 0 ? true : false
  end


# Primary Methods -----------------------------------------

  def prepare_number
    @card_num = @card_num.to_s.split(//).reverse
    digits_to_int(@card_num)
  end


  def double_digits
   @card_num.each_index do |i|
     @card_num[i] += @card_num[i] if i.odd?
     if @card_num[i] >= 10
       @card_num[i] = @card_num[i].to_s.split(//)
       @card_num[i] = sum_digits( digits_to_int(@card_num[i]) )
     end
   end
  end


  def check_card
    prepare_number
    double_digits
    valid_num?
  end

end


# Driver Code for Refactored Solution -----------------------------------------

card = CreditCard.new(4408041234567901)

p card
p card.check_card


# Reflection ==================================================================
=begin

What was the most difficult part of this challenge for you and your pair? -----

Working out the pseudocode from the instructions was very straightforward, as
was coding our initial solution from the pseudocode. In refactoring, we first
looked for opportunities to streamline the code by reducing conditionals and
iterations to single-line forms. After that, we looked for places where we had
repeated the same code on multiple lines, and wrote helper methods to replace
them in the "primary" methods. The only real difficulty we encountered, apart
from basic debugging of minor errors, was in attempting to write a helper
method to replace the nearly-identical code on lines 136 and 145. Every attempt
we made raised a Type error, and we were never able to figure out what was
causing the problem; ultimately, we decided that helper method just wasn't
meant to be, and declared ourselves done.


What new methods did you find to help you when you refactored? ----------------

Methods that were new to me in this challenge were:

* String#split - I was familiar with the general concept of a built-in
    string-splitting method from Python, but with the Ruby version, it's
    necessary to provide a reg ex as an argument if you want to split the
    array into single characters.
* Fixnum#even? and #odd? - These methods are simple and obvious, but I'd never
    used them before. Armani had them memorized, however, and popped them out
    before I could write an loop with a condition to check each number in the
    array for % 2. Very handy.
* Enumerable#reduce - We used this to sum all the integers in an array. As
    near as I can tell, #reduce attempts to squish all the values in the
    enumerable into a single value, by applying the code in the argument to
    each member. When we passed it the symbol :+, we told it to add each
    member to the sum of the members before it in the array; by the time it
    got to the end of the array, it returned the sum of all the members of
    the array as an integer.


What concepts or learnings were you able to solidify in this challenge? -------

We found the challenge to be pretty straightforward. I'd say my main takeaway
was practice with the process of creating helper methods to streamline and
clarify our code. I have a vague sense that we should have been able to
improve the iteration strategy in the #double_digit method, but I just can't
come up with a better way to do it.


=end