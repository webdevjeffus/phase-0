# Ch. 4.2 Numbers, Letters and Variable Assignment
### By Jeff George, 9.29.15, for DBC Phase 0

## Solutions to sub-challenges

* [Defining Variables](https://github.com/webdevjeffus/phase-0/blob/master/week-4/defining-variables.rb)
* [Simple String Methods](https://github.com/webdevjeffus/phase-0/blob/master/week-4/simple-string.rb)
* [Local Variables and Basic Arithmetical Operations](https://github.com/webdevjeffus/phase-0/blob/master/week-4/basic-math.rb)


## Numbers

#### What does **puts** do?

The **puts** method (short for "put string") evaluates an expression, prints the result to the screen followed by a newline character, and returns **nil**.

#### What is an integer? What is a float?

* **integer** - a whole number, without a fraction, such as **3, 29, 100000, -17,** or even **0**. (Note that computers do not use commas when manipulting and displaying numeric values; that's why **100000** is an integer, but **100,000** is a string.)
* **float** - a number with a decimal point and a decimal fraction, such as **3.1416, 29.0, 100000.00, -16.667,** or **0.0**. (Note that a "whole" number, without a fraction, is still a float if it's stored with a decimal point followed by **0**, like **5.0**.)


#### What is the difference between float and integer division? How would you explain the difference to someone who doesn't know anything about programming?

* **float** division returns the precise result of the division expression, with any remainder expressed as a decimal fraction, such as **13 / 2 = 6.5**.
* **integer** division returns the whole number result of the division expression, dropping any fraction and ignoring the remainder. In integer division, **13 / 2 = 6**, and the extra 0.5 (or the remainder of 1) is lost.


#### Mini-challenge: Hours in a year

```ruby
irb(main):001:0>puts 365 * 24
8760
=> nil
```

#### Mini-challenge: Minutes in a decade

```ruby
irb(main):002:0> puts 10 * 365.25 * 24 * 60
5259600.0
=> nil
```

_Note: The extra 0.25 days accounts for leap years, adding extra day every four years. Yes, I realize that any real ten-year period will include **either** two leap years **or** three; my program averages those possibilities, assuming there are 2.5 leap years in a decade. Oh well..._

## Challenge solutions

#### 4.2.1 Defining Variables

https://github.com/webdevjeffus/phase-0/blob/master/week-4/defining-variables.rb

#### 4.2.2 Simple String Methods

https://github.com/webdevjeffus/phase-0/blob/master/week-4/simple-string.rb

#### 4.2.3 Local Variables and Basic Arithmetical Operations

https://github.com/webdevjeffus/phase-0/blob/master/week-4/basic-math.rb

## Reflection questions

#### How does Ruby handle addition, subtraction, multiplication, and division of numbers?

On the surface, Ruby handles basic arithmetic operations in the most obvious way: [first_value] [operation] [second_value]. For example, the expression that adds 2 and 3 is simply **2 + 3**. For multiplication, you use the asterisk (__*__) instead of the letter "x" to indicate "times", as in **2 * 3**. In division, you use the slash character (**/**) in place of the normal division symbol ( **&divide;** ), as in **2 / 3**; this is easy to remember if you recall that a fraction, like 2/3, really just means "two divided by three." Subtraction just uses the regular old "dash" character on your keyboard, to the left of the numeral **0**, as in **2 - 3**.

Of course, just entering the expression may not help, since Ruby just returns the result and then forgets it. If you want to save the result and use it later on, you need to save it by assigning it to a variable. You can create a variable and assign it the value returned by an expression in a single step, by typing the name you want to use for the variable, followed by an equals sign (properly called the "assignment operator"), and then the arithmetic expression, like this:

```ruby
> my_answer = 2 * 3
=> 6
> puts my_answer
=> 6
```

I recall from other reading that, under the hood, Ruby actually treats arithmetic operations as methods called on int and float objects. If I understood this correctly, that means that **2 * 3**, in Ruby, essentially means **2.* (3)**, which is to say, "Call the 'multiply by' method on the integer object 2 with the argument 3." Not that we need to be worrying about that now&hellip;

#### What is the difference between integers and floats?

I covered this above, but essentially, an integer is a whole number with no fraction or decimal, while a float is a number that includes a decimal or fraction, even if that decimal is .0. That is, **12** is an integer, while **12.27** and **12.0** are floats.

#### What is the difference between integer and float division?

Again, this is covered in more detail above, but in short, integer division returns a whole-number result, dropping any remainder, while floating-point division returns a fractional result. For example, the expression **20 / 3** (integer division) returns **6**, while **20.0 / 3.0** (floating-point division) returns **6.33333333**.

#### What are strings? Why and when would you use them?

A string is an arbitrary series of characters of any length. Strings are typically used to store words, sentences, paragraphs, and other sequences of letter, space, digit, and symbol characters.

Although numbers can be stored as strings, the integer **42** and the string **"42"** are not completely interchangeable. Ruby sees the integer as the number 42, while it sees the string as a sequence of two characters, consisting of a "4" and a "2". The string has no awareness of place-value. The "4" in the string "42" is just a "4" character; it does not represent four tens or the value 40. This matters when you are sorting values. Sorted as integers, 328 comes after 75, because 328 is a larger number than 75; sorted as strings, "328" comes _before_ "75," because 3 comes before 7.

#### What are local variables? Why and when would you use them?

A variable is a name that we create to act as sort of container for saving and recalling values, such as integers, floats, and strings. A variable is typically assigned a name that is as short as it can be and still be descriptive and unique, like "my_age" or "middle_name." Once we assign a value to a variable, we can use the name of that variable in place of that value in expressions, like this:

```ruby
> my_age = 50
=> 50
> my_age_next_year = my_age + 1
=> 51
```

Note that in that example, on the third line, we used **my_age** to represent the integer **50**, and in the very same line, created a second variable, **my_age_next_year**, and set it to equal the result of the expression **my_age + 1**.

A _local_ variable is one that is accessible only within the current function or method; it cannot be changed directly by any activity outside the current function. This is different from other variables, such as class and global variables, which have broader "scope." I'm sure we'll be covering the scope of variables soon...

#### How was this challenge? Did you get a good review of some of the basics?

This challenge covered pretty basic programming knowledge, and my prior experience with Python and JavaScript helped alot. My main concern in this challenge was getting a handle on Ruby syntax, which is in many ways very different from the syntax of Python and JavaScript.