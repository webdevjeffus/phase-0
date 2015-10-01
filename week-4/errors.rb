# Analyze the Errors

# I worked on this challenge by myself.
# I spent [#] hours on this challenge.

# --- error -------------------------------------------------------

# Original error:
# Screw you guys " + "I'm going home." = cartmans_phrase


# This error was analyzed in the README file.

# 1. What is the name of the file with the error?
# => error.rb

# 2. What is the line number where the error occurs?
# => 8
# 3. What is the type of error message?
# => syntax error

# 4. What additional information does the interpreter provide about this type of error?
# => unexpected '=', expecting end-of-input

# 5. Where is the error in the code?
# => The **=** in:
# => "I'm going home." = cartmans_phrase

# 6. Why did the interpreter give you this error?
# => The code is attempting to assign the variable by putting the expression first, and then the variable; in Ruby (and most languages) the variable must come before the assignment operator, and the value or expression after. The correct version would be:

cartmans_phrase = "Screw you guys " + "I'm going home."


# --- error -------------------------------------------------------

def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
  end # This was the missing keyword that caused the error.
end

# This is a tricky error. The line number may throw you off.

# 1. What is the name of the file with the error?
# => errors.rb

# 2. What is the line number where the error occurs?
# => The error message _said_ the error was at the end of the file (line 194 at the time), but the problem was actually in the method definition, at line 40.

# 3. What is the type of error message?
# => syntax error

# 4. What additional information does the interpreter provide about this type of error?
# => unexpected end-of-input, expecting keyword_end

# 5. Where is the error in the code?
# => The program reached line 194, the end of the file, without ever finding the keyword **end** that it was expecting.

# 6. Why did the interpreter give you this error?
# => The keyword **end** was missing from the **while** loop, but the ruby interpreted the **end** on the next line - intended to close the method definition - as the termination of the **while** loop. This left the definition without an **end**, so ruby assumed that the entire rest of the program was part of that definition!

# --- error -------------------------------------------------------

south_park = nil # The error was that the variable had no value; I assigned it the value nil by adding **= nil**

# 1. What is the line number where the error occurs?
# => 65

# 2. What is the type of error message?
# => in `<main>': undefined local variable or method

# 3. What additional information does the interpreter provide about this type of error?
# => undefined local variable or method `south_park' for main:Object (NameError)

# 4. Where is the error in the code?
# => Ruby didn't give the purple caret indicator this time, but it identifies **south_park** as the undefined variable

# 5. Why did the interpreter give you this error?
# => The variable **south_park** had no value assigned to it. All local variables must be assigned a value (even if that value is nil) when they are created.

# --- error -------------------------------------------------------

# cartman()
# To fix this error, I'd have needed to define a method. Since I have no idea what it was intended to do, my only workable option was to comment it out.

# 1. What is the line number where the error occurs?
# => 84

# 2. What is the type of error message?
# => NoMethodError

# 3. What additional information does the interpreter provide about this type of error?
# => in `<main>': undefined method `cartman' for main:Object

# 4. Where is the error in the code?
# => Again, we got no purple caret on this one, but it does tell us exactly where the problem is: the call to the method **cartman()**.

# 5. Why did the interpreter give you this error?
# => The method **cartman()** is called without having first been defined.

# --- error -------------------------------------------------------

def cartmans_phrase
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase#('I hate Kyle')  # Commented out the arg to correct error

# 1. What is the line number where the error occurs?
# => 104

# 2. What is the type of error message?
# => ArgumentError

# 3. What additional information does the interpreter provide about this type of error?
# => in `cartmans_phrase': wrong number of arguments (1 for 0) AND from errors.rb:108:in `<main>'

# 4. Where is the error in the code?
# => No caret, but tells where to look: the call to **cartmans_phrase** on line 108

# 5. Why did the interpreter give you this error?
# => The call to **cartmans_phrase** passes an argument - a string - when the definition of the method does not call for or use any arguments at all. I fixed it by commenting out the argument passed with the method call on line 108.

# --- error -------------------------------------------------------

def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says("Respect my authoritay!")
# I added the argument to fix the error; the original code just had **cartman_says**, with no argument.

# 1. What is the line number where the error occurs?
# => 127

# 2. What is the type of error message?
# => ArgumentError

# 3. What additional information does the interpreter provide about this type of error?
# => in `cartman_says': wrong number of arguments (0 for 1) AND from errors.rb:131:in `<main>'

# 4. Where is the error in the code?
# => The error message tells us to look at line 131, where the call to **cartman_says** is made.

# 5. Why did the interpreter give you this error?
# => We called the method **cartman_says** without passing it an argument; the method definition calls for an argument, a string, to tell it what to **puts**. I fixed it by adding a string as an argument to the method call.



# --- error -------------------------------------------------------

def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!', 'Butters') # Orignal code had only one argument; I added the missing **name** argument to fix the error.

# 1. What is the line number where the error occurs?
# => 153

# 2. What is the type of error message?
# => ArgumentError

# 3. What additional information does the interpreter provide about this type of error?
# => in `cartmans_lie': wrong number of arguments (1 for 2) AND from errors.rb:157:in `<main>'

# 4. Where is the error in the code?
# => On line 157, we have a call to **cartmans_lie** with the wrong number of arguments

# 5. Why did the interpreter give you this error?
# => The definition of **cartmans_lie** specifies two parameters, but the call on line 157 only provides one argument. I fixed it by adding a second parameter.

# --- error -------------------------------------------------------

"Respect my authoritay!" * 5
# The original code was: 5 * "Respect my authoritay!"
# I reversed the order of the objects, so that ruby would print the string 5 times, which it does know how to do.

# 1. What is the line number where the error occurs?
# => 176

# 2. What is the type of error message?
# => TypeError
# 3. What additional information does the interpreter provide about this type of error?
# => in `*': String can't be coerced into Fixnum (TypeError) AND from errors.rb:176:in `<main>'

# 4. Where is the error in the code?
# => This error actually _is_ on line 176, as the error message suggests.

# 5. Why did the interpreter give you this error?
# => The code is attempting to multiply an integer by a string; because it can't convert the string into an integer, it can't evaluate the expression, and therefore throws an error.

# --- error -------------------------------------------------------

amount_of_kfc_left = 0/20 # original value: 20/0


# 1. What is the line number where the error occurs?
# => 196

# 2. What is the type of error message?
# => ZeroDivisionError

# 3. What additional information does the interpreter provide about this type of error?
# => in `/': divided by 0 (ZeroDivisionError) AND from errors.rb:196:in `<main>'

# 4. Where is the error in the code?
# => Again, the error is on the line identified by the error message: 196.

# 5. Why did the interpreter give you this error?
# => It is impossible to divide by zero. I infer that the intent was to set **amount_of_kfc_left** to 0 out of 20, so when I fixed the code, I changed it from **20/0** to **0/20**.

# --- error -------------------------------------------------------

# require_relative "cartmans_essay.md"

# 1. What is the line number where the error occurs?
# => 216

# 2. What is the type of error message?
# => LoadError

# 3. What additional information does the interpreter provide about this type of error?
# => in `require_relative': cannot load such file -- /Users/webdevjeff15/dbc-ph0/phase-0/week-4/cartmans_essay.md AND from errors.rb:216:in `<main>'

# 4. Where is the error in the code?
# => The error actually _is_ on line 216.

# 5. Why did the interpreter give you this error?
# => I am pretty sure that **require_relative** is attempting to load a file, **cartmans_essay.md** that doesn't exist. I have no way to fix this one, since there is no **cartmans_essay.md** file; the only way to "fix" it is to comment the line out.


# --- REFLECTION -------------------------------------------------------

=begin

#### Which error was the most difficult to read?

These errors were pretty straightforward. Heck, half of them were different versions of the same error: the wrong number of arguments passed to a method. The only one with a semi-tricky error message was actually the first one (not counting the demo), with the missing keyword **end** inside the method definition. The tricky bit was that the error message said the error occured at the end of the file; fortunately, because it was an exercise and not a "real" program, I knew within four lines where the error had to really be. I can imagine that a missing **end** keyword could be much harder to find in a program several hundreds or thousands of lines long.


#### How did you figure out what the issue with the error was?

I could tell from the error message that we were missing **end** somewhere, and I knew from the assignment that it had to be somewhere around the method definition for **cartman_hates**. I checked ruby docs (actually, a pocket reference I have on my desk) for the proper syntax for a **while** block, and confirmed that it needed its own **end**, apart from the **end** that ended the definition.


#### Were you able to determine why each error message happened based on the code?

Well, reading the error message and looking at the code, I was able to work out the problem in each case. I did check references on the **while** statment syntax, and the function of **require_relative**, to help resolve those two errors.


#### When you encounter errors in your future code, what process will you follow to help you debug?

The first step is to read the error message closely, to determine what sort of error I'm dealing with, and to get a clue as to where to look. The line number indicated in the message may be where the error is, or it may just be where an error early in the program actually caused a problem. In either case, I'll compare the code on and around the line number in the error with the information given in the error message, and try to find where and what has gone wrong. If the error isn't right at the indicated line number, I'll check for code that is related to the code that _is_ there...like a call from elsewhere in the code to a method defined at the line indicated in the error message. Once you figure out _where_ the problem is, it's most likely a matter of fixing a syntax or type error, which should be pretty apparent if you are looking at the right spot. (Emphasis on _should_...)

=end

