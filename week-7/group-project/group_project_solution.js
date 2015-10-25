/*

Group Project, Person 1
User Stories

I need a JavaScript program that will perform three different mathematical
functions on a set of integers. The program must be able to handle sets of any
size, and the sets may include an even or odd number of members. The members
of the set may or may not be in numeric order when entered into the function.
The program must perform the following functions on these sets of integers:

SUM ___________________________________________________________________________
The program must accept a set of whole numbers, and find the sum of all of its
members. For example, if the set is (3,5,8,9), the SUM will equal 3+5+8+9,
or 25.

Additional information and examples for SUM can be found at:
https://www.mathsisfun.com/definitions/sum.html


MEAN___________________________________________________________________________
The program must accept a set of whole numbers, and find the MEAN of those
numbers. The MEAN will be equal to the SUM of the members of the set, divided
by the quantity of members in the set. The result of the MEAN function may be
a number with a decimal fraction of any length. For example, in a set of
(2, 5, 8, 9), the MEAN equals (3+5+8+9)/4, or 6.25.

Additional information and examples for MEAN can be found at:
https://www.mathsisfun.com/definitions/mean.html


MEDIAN_________________________________________________________________________
The program must accept a set of whole numbers, and find the MEDIAN of those
numbers. In general, the MEDIAN of a set is the number in the middle of the
set when its members are arranged in order from smallest to largest. In the
case of a set with an odd number of members, the MEDIAN will be defined as the
number in the middle of the ordered set, with an equal number of members
smaller than itself and larger than itself. For example, if the set is
(1, 2, 3, 4, 5), the MEDIAN will be 3.

In the case of a set with an even number of members, the MEDIAN will be the
value half-way between the values of the largest member of the smaller half
of the ordered set, and the smallest member of larger half of the set. For
example, if the set is (1, 2, 3,   4, 5, 6), the MEDIAN will be 3.5.

Additional information and examples for MEDIAN can be found at:
https://www.mathsisfun.com/definitions/median.html


===============================================================================
=============================== FINAL SUMMARY =================================
===============================================================================

Test Output____________________________________________________________________

group-project [group] :> node tests.js
1. true
2. true
3. true
4. true
5. true
6. true
7. true
8. true
9. false

/Users/webdevjeff15/DBC-ph0/phase-0/week-7/group-project/tests.js:79
    throw "ERROR: " + message;
                    ^
ERROR: median should return the median value of all elements in an array with
an even length.
_______________________________________________________________________________

Our code passed all tests except the last one, which tested for finding the
MEDIAN of an array with an even number of elements. There was apparently a
logical error in the line of code intended to find the two numbers in the
middle of the set, which would be averaged to find the median of the set.

Good effort, everyone! We'll get 'em next time!


*/