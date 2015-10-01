# Analyze the Errors - 4.4
### By Jeff George, 9.30.15, for DBC Phase 0

_Note:_ This file is a copy of the **errors.rb** file created for the assignment. I have reformatted as a markdown file for ease of reading, and edited the content to show both the original code snippets with their errors, and the fixed versions where a fix is possible. Unfortunately, the line numbers were lost in the conversion, so you'll have to trust me on those.

I worked on this challenge by myself.
I spent 2-3 hours on this challenge, not counting reformatting it for this file.

## Errors

#### Error #1

**Original code with error**
```ruby
"Screw you guys " + "I'm going home." = cartmans_phrase
```

(This error was analyzed in the README file.)

_1. What is the name of the file with the error?_
error.rb

_2. What is the line number where the error occurs?_
Line 8

_3. What is the type of error message?_
Syntax error.

_4. What additional information does the interpreter provide about this type of error?_

unexpected '=', expecting end-of-input

_5. Where is the error in the code?_

The message indicates the error is at the **=** in:

"I'm going home." = cartmans_phrase

_6. Why did the interpreter give you this error?_

The code is attempting to assign the variable by putting the expression first, and then the variable; in Ruby (and most languages) the variable must come before the assignment operator, and the value or expression after. The correct version would be:

```ruby
cartmans_phrase = "Screw you guys " + "I'm going home."
```

## Error #2

**Original code with error**
```ruby
def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
end
```

_Note: This is a tricky error. The line number may throw you off._

_1. What is the name of the file with the error?_
errors.rb

_2. What is the line number where the error occurs?_

The error message _said_ the error was at the end of the file (line 194), but the problem was _actually_ in the method definition, at line 40.

_3. What is the type of error message?_
Syntax error

_4. What additional information does the interpreter provide about this type of error?_

unexpected end-of-input, expecting keyword_end

_5. Where is the error in the code?_

The program reached line 194, the end of the file, without ever finding the keyword **end** that it was expecting.

_6. Why did the interpreter give you this error?_

The keyword **end** was missing from the **while** block, but ruby interpreted the **end** on the next line - intended to close the method definition - as the termination of the **while** loop. This left the definition without an **end**, so ruby assumed that the entire rest of the program was part of that definition!

**Code with error corrected**
```ruby
def cartman_hates(thing)
  while true
    puts "What's there to hate about #{thing}?"
  end   # <--- This was the missing keyword that caused the error.
end
```

## Error #3

```ruby
south_park
```

_1. What is the line number where the error occurs?_
65

_2. What is the type of error message?_
Name error

_3. What additional information does the interpreter provide about this type of error?_

in `<main>': undefined local variable or method `south_park' for main:Object

_4. Where is the error in the code?_

Ruby didn't give the purple caret indicator this time, but it identifies **south_park** as the undefined variable.

_5. Why did the interpreter give you this error?_

The variable **south_park** had no value assigned to it. All local variables must be assigned a value (even if that value is nil) when they are created.

**Code with error corrected**
```ruby
south_park = nil
```

## Error #4

**Original code with error**
```ruby
cartman()
```

_1. What is the line number where the error occurs?_
84

_2. What is the type of error message?_
No method error

_3. What additional information does the interpreter provide about this type of error?_

in \`<main>\': undefined method `cartman' for main:Object

_4. Where is the error in the code?_
Again, we got no purple caret on this one, but it does tell us exactly where the problem is: the call to the method **cartman()**.

_5. Why did the interpreter give you this error?_

The method **cartman()** is called without having first been defined.

**Code with error corrected**
```ruby
# cartman()
# To fix this error, I'd have needed to define the **cartman()** method.
# Since I have no idea what it was intended to do,
# my only workable option was to comment it out.
```

## Error #5

**Original code with error**
```ruby
def cartmans_phrase
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase('I hate Kyle')
```

_1. What is the line number where the error occurs?_
104

_2. What is the type of error message?_
Argument error

_3. What additional information does the interpreter provide about this type of error?_

* in `cartmans_phrase': wrong number of arguments (1 for 0)
* from errors.rb:108:in `\<main\>'

_4. Where is the error in the code?_

No caret, but ruby tells us where to look: the call to **cartmans_phrase** on line 108.

_5. Why did the interpreter give you this error?_

The call to **cartmans_phrase** passes an argument - a string - when the definition of the method does not call for or use any arguments at all. I fixed it by commenting out the argument passed with the method call on line 108.

**Code with error corrected**
```ruby
def cartmans_phrase
  puts "I'm not fat; I'm big-boned!"
end

cartmans_phrase #('I hate Kyle')
# Commented out the argument to correct error
```

## Error #6

**Original code with error**
```ruby
def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says
```

_1. What is the line number where the error occurs?_
127

_2. What is the type of error message?_
Argument error

_3. What additional information does the interpreter provide about this type of error?_

* in `cartman_says': wrong number of arguments (0 for 1)
* from errors.rb:131:in `\<main\>'

_4. Where is the error in the code?_

The error message tells us to look at line 131, where the call to **cartman_says** is made.

_5. Why did the interpreter give you this error?_

The code called the method **cartman_says** without passing it an argument. The method definition calls for an argument, a string, to tell it what to **puts**. I fixed it by adding a string as an argument to the method call.

**Code with error corrected**
```ruby
def cartman_says(offensive_message)
  puts offensive_message
end

cartman_says("Respect my authoritay!")
```


## Error #7

**Original code containing error**
```ruby
def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!')
```

_1. What is the line number where the error occurs?_
153

_2. What is the type of error message?_
Argument error

_3. What additional information does the interpreter provide about this type of error?_

* in `cartmans_lie': wrong number of arguments (1 for 2)
* from errors.rb:157:in `\<main\>'

_4. Where is the error in the code?_

On line 157, we have a call to **cartmans_lie** with the wrong number of arguments.

_5. Why did the interpreter give you this error?_

The definition of **cartmans_lie** specifies two parameters, but the call on line 157 only provides one argument. I fixed it by adding a string as a second argument.

**Code with error corrected**
```ruby
def cartmans_lie(lie, name)
  puts "#{lie}, #{name}!"
end

cartmans_lie('A meteor the size of the earth is about to hit Wyoming!', 'Butters')
```

## Error #8

**Original code containing error**
```ruby
5 * "Respect my authoritay!"
```

_1. What is the line number where the error occurs?_
176

_2. What is the type of error message?_
Type error

_3. What additional information does the interpreter provide about this type of error?_

* in `*': String can't be coerced into Fixnum
* from errors.rb:176:in `\<main\>'

_4. Where is the error in the code?_

This error actually _is_ on line 176, as the error message suggests.

_5. Why did the interpreter give you this error?_

The code is attempting to multiply an integer by a string. Because ruby can't convert the string into an integer, it can't evaluate the expression, and therefore throws an error.

**Code with error corrected**
```ruby
"Respect my authoritay!" * 5
```


## Error #9

**Original code containing error**
```ruby
amount_of_kfc_left = 20/0
```

_1. What is the line number where the error occurs?_
196

_2. What is the type of error message?_
Zero division error

_3. What additional information does the interpreter provide about this type of error?_

* in `/': divided by 0 (ZeroDivisionError)
* from errors.rb:196:in `\<main\>'

_4. Where is the error in the code?_

Again, the error is on the line identified by the error message: 196.

_5. Why did the interpreter give you this error?_

It is impossible to divide by zero. I infer that the intent was to set **amount_of_kfc_left** to 0 out of 20, so when I fixed the code, I changed it from **20/0** to **0/20**.

**Code with error corrected**
```ruby
amount_of_kfc_left = 0/20
```


## Error #10

**Original code containing error**
```ruby
require_relative "cartmans_essay.md"
```

_1. What is the line number where the error occurs?_
216

_2. What is the type of error message?_
Load error

_3. What additional information does the interpreter provide about this type of error?_

* in `require_relative': cannot load such file -- /Users/webdevjeff15/dbc-ph0/phase-0/week-4/cartmans_essay.md
* from errors.rb:216:in `\<main\>'

_4. Where is the error in the code?_
The error actually is on line 216.

_5. Why did the interpreter give you this error?_

I am pretty sure that **require_relative** is attempting to load a file, **cartmans_essay.md**, that doesn't exist. I have no way to fix this one, since there is no **cartmans_essay.md** file; the only way to "fix" it is to comment the line out.


## Reflection Questions

#### Which error was the most difficult to read?

These errors were pretty straightforward. Heck, half of them were different versions of the same error: the wrong number of arguments passed to a method. The only one with a semi-tricky error message was actually the first one (not counting the demo), with the missing keyword **end** inside the method definition. The tricky bit was that the error message said the error occured at the end of the file; fortunately, because it was an exercise and not a "real" program, I knew within four lines where the error had to really be. I can imagine that a missing **end** keyword could be much harder to find in a program several hundreds or thousands of lines long.


#### How did you figure out what the issue with the error was?

I could tell from the error message that we were missing **end** somewhere, and I knew from the assignment that it had to be somewhere around the method definition for **cartman_hates**. I checked ruby docs (actually, a pocket reference I have on my desk) for the proper syntax for a **while** block, and confirmed that it needed its own **end**, apart from the **end** that ended the definition.


#### Were you able to determine why each error message happened based on the code?

Well, reading the error message and looking at the code, I was able to work out the problem in each case. I did check references on the **while** statment syntax, and the function of **require_relative**, to help resolve those two errors.


#### When you encounter errors in your future code, what process will you follow to help you debug?

The first step is to read the error message closely, to determine what sort of error I'm dealing with, and to get a clue as to where to look. The line number indicated in the message may be where the error is, or it may just be where an error early in the program actually caused a problem. In either case, I'll compare the code on and around the line number in the error with the information given in the error message, and try to find where and what has gone wrong. If the error isn't right at the indicated line number, I'll check for code that is related to the code that _is_ there...like a call from elsewhere in the code to a method defined at the line indicated in the error message. Once you figure out _where_ the problem is, it's most likely a matter of fixing a syntax or type error, which should be pretty apparent if you are looking at the right spot. (Emphasis on _should_...)

