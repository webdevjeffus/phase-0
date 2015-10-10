# Numbers to Commas - Solo Challenge 5.5
#### By Jeff George, 10/8/15, for DBC Phase 0

**I spent 8 hours on this challenge.**


## 0. Pseudocode

**_What is the input?_** A positive integer ("positive_int").

**_What is the output?_** The number as string, with the digits separated into columns by threes (e.g. "35", "1,000", "45,321")

**_What are the steps needed to solve the problem?_**
```
CONVERT positive_int to string
SET a counter

UNTIL (counter * 4) is larger than length of string
  INSERT a comma at a position (4 * counter) from _end_ of string
  INCREMENT counter

RETURN string
```

## 1. Initial Solution
```ruby
def separate_comma(positive_int)

  string = positive_int.to_s
  i = -4

  until i <= 0 - (string.length + 1)
    string = string.insert(i,",")
    i -= 4
  end

  return string
end
```


## 1a. Refactored version of initial solution
_Simplifies implementation of index and index checks, but actually makes code longer..._

```ruby
def insert_commas(positive_int)

  string = positive_int.to_s
  i = 0

  until i  > string.length / 4
    if i > 0
      string = string.insert( i * -4,",")
    end
    i += 1
  end

  return string
end
```


## 2. First Refactored Solution

#### NEW PSEUDOCODE
```
REVERSE string
SLICE reversed string into three-digit chunks
REJOIN chunks, separated by commas, into a string
REVERSE string and return it
```

```ruby
def insert_commas(positive_int)

  string = positive_int.to_s.reverse
  int_array = []

  until string.length <= 0 do int_array << string.slice!(0,3) end

  int_array.join(",").reverse

end
```


## 2a. One-line Refactored Solution
_I cobbled this together borrowing elements from several stackoverflow answers._

```ruby
def insert_commas(positive_int)
  positive_int.to_s.reverse.chars.each_slice(3).map{|s| s.join}.join(",").reverse
end
```



## 3. Reflection
#### What was your process for breaking the problem down? What different approaches did you consider?

Basically, I just thought it through step by step as pseudocode, listing each thing I needed to do, in the order I needed to do it. Of course, there was some revision of the logic in the pseudocode before I was ready to start coding.

#### Was your pseudocode effective in helping you build a successful initial solution?

My pseudocode led pretty directly to the first solution shown. The second version of the initial solution uses essentially the same logic, but attempts to make the index more intuitive. Since the both versions of the initial solution insert commas in positions counting from the _end_ of the string, I need to use  negative numbers with the **String#insert** method. In the first version, I start the counter at -4, and subtract 4 more with each iteration of the **until** loop; means that the **until** conditional has to compare the increasingly negative counter to the inverse of the **string.length**, which felt odd.

The second version starts the counter at a more traditional value of 0, and increments it by 1 on each loop, but I had to add an **if** statment in order to avoid adding an unnecessary comma to numbers of 3 digits or less. Moving from the first to second solutions, I didn't re-pseudocode the method&mdash;I just edited the solution in another file, testing it repeatedly along the way.


#### What Ruby method(s) did you use when refactoring your solution? What difficulties did you have implementing it/them?

I used several methods that were new to me. Even in the initial solutions, I used **String#insert**, which injects one string (in thus case, just a ",") into another string at a specified index position.

In the first refactored solution, I used **String#reverse** to reverse the order of the digits to make it easier to group them into strings of three digits starting from right to left; the destructive version of **String#slice!** to lop off each group of three digits, which was immediately shoveled onto the end of an array, **int_array**; and **Array#join** to glue the array of strings into a single string with separating commas. Another call to **#reverse** was necessary to switch the number string back into left-to-right format, so that it would return correctly.

The one-line version manages to eliminate the **until** loop, but it uses a bunch of method calls on a single line. Here are the methods called, and what they each do, in order:

* **to_s** converts the incoming integer into a string.
* **reverse** reverses the digits that make up the string, so I can insert commas every third space from left to right.
* **chars** converts the string into an array of single-character strings.
* **each_slice(3)** returns an enumerator that sets up single-character strings into groups of three (I am admittedly fuzzy on just how this part happens).
* **map{|s| s.join}** does the actual joining of the single-character strings into strings of three characters.
* **join(",")** puts the strings back together, separated by commas.
* **reverse** puts the string back into proper, left-to-right order for display.


#### Did it/they significantly change the way your code works? If so, how?

The methods in the refactored solutions completely changed the logic of the method. In the first two versions, I was inserting comma characters into a string one at a time, at specific points, working backwards from the end. In the refactored versions, I chopped the number string into an array of three-digit chunks, and rejoined them into a single string with comma separators in a single action. Also, in the first versions, I never reversed the string, but counted backwards from its end to position the commas; in the final version, I reversed the string, injected the commas, and then "unreversed" the string with a second reverse call.


#### How did you initially iterate through the data structure?

In all but the one-line solution, I used **until** to handle my iteration. In the first two versions, I used an index, incremented or decremented with each loop, to determine when the loop should terminate. Because the first refactored version used **slice!**, I could eliminate the index counter in the final solution, and just check the length of the string as each loop reduced it by 3 characters; once the string was down to 0 characters, the **until** loop concluded.

The one-line solution uses **each_slice** and **map** to iterate over the array (it's an array at the moment that they hit it!) and glue it into chunks of three digits with commas in-between.


## Do you feel your refactored solution is more readable than your initial solution? Why?

Yes, I think the first refactored version is a bit easier to read. Because the original solution depended on counting backwards by fours, it requires the use of a counter which is adjusted by -4 with each loop, which has to be compared to the inverse of the value of **string.length+1**...which is pretty mind-bending. In the second version, I was able to make the counter work from 0, and increment by 1 with each loop, which is easier to follow, but that necessitated comparing it to **string.length / 3** in the **until** check, and multiplying it by -4 to get the right position for inserting the commas in the **insert** call. Again, pretty confusing.

In the first refactored solution, the only numbers you have to deal with are the 0 starting index for each slice, and the 3 for the size of the slice. This simpler math makes the final version easier to unpack, at least for me.

The final refactored solution is more of a stunt than anything: just proving the method can written done on a single line. It's much too hard to read without careful parsing to be very practical in a real codebase that has to be maintained. If I were going to use its logic, I'd probably look for logical places to split it onto three or four lines, so less is happening on each line.