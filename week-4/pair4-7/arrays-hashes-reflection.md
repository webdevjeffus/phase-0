# Reflection: Arrays and Hashes
**by Jeff George, 10.3.15, for DBC Phase 0, Ch. 4.7**

#### What are methods? Why are they useful?

A method is a named block of code that can be called and run from anyplace in the program. Methods are useful because they make the overall program more concise, readable, and maintainable. Methods can even be grouped into libraries, which are collections of pre-written code which can be included by new programs, and the methods within them called from within the new program.

As an example of usefulness of the method, take the factorial method we defined in this challenge. If we knew (or realized along the way) that we were going to need to find the factorial of a number several times within a program, we could define a factorial(int) method like the one we wrote here, and then call it over and over again within the program, whenever we need it. This would save us having to repeat the code that calculates the factorial value of a number every time we need to know it, and if we ever discovered a bug in our factorial calculation, we only have to fix it in one spot. Putting code like this into a method makes our program easier to write, easier to read, and easier to maintain.


#### What are local variables? Where are they able to be accessed?

Local variables are variables that are declared, assigned a value, referenced, and manipulated strictly within the scope of a single block of code, such as a method or loop. In the case of nested blocks, such as a while loop inside a method definition, the child block (the while loop) can access the parent block's (the method's) local variables, because the child block lives entirely within the scope of its parent block. However, code inside the parent method, but not inside the child while loop, cannot access any local variables created within the child loop; such code is outside the scope of the child loop and its variables.

The only way to get values into a method is to pass them in as arguments, and the only way to get them back out again is for the method to return them. For example, we write a method to sum the members of an array of integers. We pass the array into the method as an argument. Inside the scope of the method, we create a local variable to hold the sum of the members of the array. But code outside the method can't ask for the value stored in that local variable, because that code is outside the method's scope. In order to use the value stored in that local variable outside the method, the method needs to return that value.

#### What is a method's argument? How would you use that?

When a method is defined, it can be assigned to take parameters, which are variables local to the scope of that method, created as part of the method definition. An argument is the value that is assigned to a parameter variable and passed into the method when it is called by the code. Think of the parameters as envelopes that are created when the method is defined, pre-addressed to various lines within the method. The arguments are the actual values placed into those envelopes when the method is called, which then get used to actually run the code within the method.

#### How does Ruby know what to return in a method?

There are two ways that Ruby determines what value a method should return. By default, Ruby returns the last value of the last expression evaluated before the method terminates. If a different value needs to be returned, such as when a series of if/elsif/else statements leads to different results from running the method, the programmer can force the method to return another value using the return keyword.


#### What does it mean to iterate (or loop) over arrays or hashes?

Essentially, to iterate over an array or hash means to do the same thing to each member of the array or hash, once each, one by one, in sequence. In the following example, we use an .each loop to iterate over the array, adding 2 to the value of each member:

``` ruby
[ 1, 2, 3 ].each { |num| num+2 }   =>  [ 3, 4, 5 ]
```

#### What new Ruby methods did you learn about in this challenge?

* **each** - loops over an array and applies the specified code to each member
* **reduce** - loops over an array and applies the specified code, reducing the array to a single value and returning that value
* **capitalize** and **capitalize!** - Capitalizes the first letter of a string and returns the capitalized string; **capitalize!** changes the string in place
* **lstrip** and **rstrip** - Removes the whitespace, if any from, the left or leading end of a string (or the right or rear end of the string, for **rstring**), and returns the string without the whitespace
* **join** - concatenates the members of an array into a string; if an optional string argument is added, such as ( **"-"** ), **join** inserts that string as a separator between the array elements when it joins them into a string.

#### What did you learn from your pair in this challenge?

My partner brought a careful and meticulous approach to our work which was very effective at catching errors in our logic and our code. Several times, she noted oversights or errors that we were able to quickly correct. Her fine-tooth-comb approach even found an opportunity to improve a parameter name after the session, a change she messaged me about so that I could also make the improvement in the code I turned in. Her attention to detail is something that I can work to incorporate into my own practice.

She also had the clever idea of copying key information from the Ruby docs into our workspace on Coderpad so we could reference it easily while we worked; I don't know if this was an on-the-spot inspiration, or something she'd already discovered, but it was a great convenience that sped up our work.