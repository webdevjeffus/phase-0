# Pad an Array - Pair Challenge 5.2
**By Jeff George, 10.6.15, for DBC Phase 0**

**I worked on this challenge Joshua Abrams.**

I spent 4.5 hours on this challenge, including reflections.


## 0. Pseudocode

#### What is the input?
An array, a minimum length for output, and a value to use to pad out the array to the minimum length, if necessary.

#### What is the output? (i.e. What should the code return?)
The code should return an array at least as long as the minimum length, including sufficient copies of the value to pad the array if necessary. The non-descructive version should return a new array; the destructive version should alter the array in place.

#### What are the steps needed to solve the problem?
```
IF array length equal to or longer than min_size
  RETURN array as it is

ELSE (array length < min_size)
  UNTIL array length equals min_size
    APPEND value to array
  RETURN array padded out
```


## 1. Initial Solution
_Follows pseudocode closely_

```ruby
def pad(array, min_size, value=nil)

  temp_array = array.clone

  if temp_array.length >= min_size

    return temp_array

  else

    until temp_array.length == min_size

      temp_array << value
    end

    return temp_array
  end
end


def pad!(array, min_size, value=nil)

  if array.length >= min_size

    array

  else

    until array.length == min_size

      array << value
    end

  end
  return array
end
```


## 3. Refactored Solution
_Eliminates unnecessary if/else conditional_

```ruby
def pad(array, min_size, value=nil)

  temp_array = array.clone

  until temp_array.length >= min_size
    temp_array << value
  end

  return temp_array

end


def pad!(array, min_size, value=nil)

  until array.length >= min_size
    array << value
  end

  return array

end
```


#3.5 A leaner refactored solution
_Uses Array#fill method to replace until loop_
```ruby
def pad(array, min_size, value=nil)

  array.clone.fill(value, array.length, min_size - array.length)

end


def pad!(array, min_size, value=nil)

  array.fill(value, array.length, min_size - array.length)

end
```


## 4. Reflection

#### Were you successful in breaking the problem down into small steps?

Yes, I think we did a pretty good job of laying out the logic of the problem in our pseudocode. We did run into a challenge in our implementation, but that had to do with figuring out how _not_ to alter an array in place (how to do it non-destructively).


#### Once you had written your pseudocode, were you able to easily translate it into code? What difficulties and successes did you have?

We initially tried to pull out the until loop in our pseudocode out into a separate method, and call that method from within #pad. However, we were having problems making the program pass rspec at that point, and one of the first things we tried was to put the until loop back into the else block. In hindsight, I don't think that having that loop in a separate "sub-method" was the cause of our problem, but we eventually wound up refactoring to the point that the if/else was removed, and the until loop was the only thing left in the program anyway. (And finally refactored with Array#fill to take the until loop out entirely!)

In any case, we managed to convert our pseudocode into working code that ran in the terminal and handled the test cases in the instructions on Canvas without too much trouble. Where we ran into trouble was when we went back to running the solution in rspec, and even after we excised the syntax errors, we were still failing the tests that checked whether the non-destructive version was actually non-destructive. It wasn't, and we couldn't figure out why not for quite a while. At least we learned how to check for that by looking through the rspec file, and discovering the #object_id method, which we then added to our own tests in the terminal. (The saga continues in the next answer...)


#### Was your initial solution successful at passing the tests? If so, why do you think that is? If not, what were the errors you encountered and what did you do to resolve them?

So, no, even once the syntax errors were all fixed, we still couldn't make a non-destructive version. Our reading told us that unlike string methods, most array methods _are_ destructive by default--that is, they modify the existing string, instead of returning a new one. We tried just creating a temporary array within the method and setting it equal to the original array, but that didn't work--our new variable just pointed at the array with the exact same object_id as the original. We were passing all the tests for the content of the returned array, and for the destructive version, #pad!, but we coudln't get #pad not to overwrite the original array.

We combed through all the Array methods in the docs, and couple a few out, but nothing did the job. Joshua eventually googled up a stackoverflow post that mentioned a method called "clone," which I had never heard of. We inferred from the post on stackoverflow that this #clone method might actually create the duplicate array that we needed in order to avoid stomping on the original array, and through experimentation, we managed to get put #clone on the right line, and with the right syntax, to give us the array internal to our method that we needed. By creating a temporary array that was a _clone_ of the original, we had finally made a _different_ array, and not just a different _pointer_ to the same array. Victory!


#### When you refactored, did you find any existing methods in Ruby to clean up your code?

Our first cut at refactoring was to optimize our logic. Our pseudocode began with an if/else check that returned the original array (or its clone!) if the array was already longer than the minimum size parameter. Looking over our original solution, we realized that both the "if" and the "else" were returning temp_array. That made us wonder if we could word the until conditional in such a way that not only made the iteration stop when a small array had grown to the minimum size, but also prevented the loop from firing at all if the array started out over the minimum size. We found that by changing == to >= in the until conditional, we could eliminate the if/else statements entirely, and let the until conditional handle all cases.

The final refactored solution was the result of additional research and testing. We found that with the proper arrangement of arguments, the Array#fill method could handle everything our until method was doing, including inserting the specified value (or a default) into any empty slots at the back end of the array. After a little bit of trial and error, we were able to figure out how to set up the arguments to #fill so that we could eliminate the until block entirely, and solve the entire problem with a one-line solution.


#### How readable is your solution? Did you and your pair choose descriptive variable names?

The final refactored solution is actually _so_ short that it takes a close read to parse it, at least for me, but it's certainly clear enough to be understood by anyone familiar with the clone and fill methods.The earlier solutions were pretty simple and straightforward, too, and didn't seem to require an comments to be understandable.

The only variable name we needed that wasn't specified by the instructions for the assignment on Canvas was for the temporary array that we set up to hold the new array that would be local to the method. "temp_array" seems a clear enough name for that variable. And at any rate, the final refactored, one-line solution doesn't use _any_ variables except the parameter names we were handed in the instructions.


#### What is the difference between destructive and non-destructive methods in your own words?

Quite simply, a destrutive method directly operates upon and alters the object it is called upon, while a non-destructive method does its work on a separate object that starts out as an identical copy of the original, but is returned after the method's code has been run upon it.


