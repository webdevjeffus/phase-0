# Ch. 4.2 Numbers, Letters and Variable Assignment
### By Jeff George, 9.29.15, for DBC Phase 0

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
