# Calculate the Mode&mdash;Pairing Challenge 5.3
### by Jeff George, 10.7.15, for DBC Phase 0

* I worked on this challenge Jay Yee.
* I spent 4 hours on this challenge, including individual research. (We broke after finding an initial solution and not seeing a good way to refactor. After individual research, we got back together and implemented the refactored solution. )


## 0. Pseudocode

**_What is the input?_** An array of strings or numbers

**_What is the output?_** A new array of items appearing most frequently in the input array

**_What are the steps needed to solve the problem?_**

```
DEFINE METHOD "mode", which works on an array

  CREATE output array
  CREATE empty hash

  POPULATE hash with keys as items from array, values = 0

  ITERATE over array, increment hash values as keys are found in array

  SORT hash by value, largest to smallest
    (Note: This didn't work by sorting; we ended up instead iterating
    over the mode_hash once to identify the key with the highest value,
    and saved that value to a local variable.)

  ITERATE over hash, checking for values that match first value
    ADD key for first value and matching values to output array
    BREAK out of iteration on first failure to match
      (Note: This also didn't work. After we found the highest value
      in the mode_hash, we iterated over the hash a second time,
      checking for values that matched the highest value, and
      shovelling those into the output array.)

  RETURN output array
```


## 1. Initial Solution

```ruby
def mode(array)

  out_array = []
  mode_hash = Hash.new(0)

  array.each do | item |
    mode_hash[item] += 1
  end

  highest = 0
  mode_hash.each do |key, value|
    if value >= highest
      highest = value
    end
  end

  mode_hash.each do |key, value|
    if value == highest
      out_array << key
    end
  end

  return out_array

end
```


## 3. Refactored Solution

```ruby
def mode(array)

  # Create hash to store item-frequency pairs, sets initial value for keys to 0
  mode_hash = Hash.new(0)

  # Compute frequency of each item in array, stores in hash
  array.each { | item | mode_hash[item] += 1 }

  # Return array containing keys selected because their value equals the max value
  mode_hash.select{ |k,v| v == mode_hash.values.max}.keys

end
```



## 4. Reflection
#### Which data structure did you and your pair decide to implement and why?

We realized right away that the right data structure to solve the problem was a hash, since we needed to save each value found in the array, along with the frequency of its appearance in the array, as key-value pairs.

#### Were you more successful breaking this problem down into implementable pseudocode than the last with a pair?

Yes and no. We worked out an alogorithm that we thought would work, but it relied upon sorting the hash by value, then accessing the first or last value in the re-ordered has as the largest value. It proved impossible (or perhaps just impractically difficult -- I don't know enough to say which) to treat the sorted hash as an ordered set, so we had to abandon that algorithm. We evolved our second approach--finding the highest value in the hash, then iterating over the hash to find and capture matches--by making iterative changes to our working code. Thus, the pseudocode gave us a first approach, but we had to revise it heavily in real code to make it solve the problem.


#### What issues/successes did you run into when translating your pseudocode to code?

The biggest problem was the fact that it didn't work. Our algorithm relied on the ability to sort hashes and access their members by order, which hashes aren't really set up to do. We had read that in the current versions of Ruby, items in hashes are stored in the order that they are entered in the hash. Even so, there aren't any methods in the standard Ruby hash methods that allow you to take advantage of the fact that the hash knows the order of its items. This latter problem made it impossible to implement the approach that we originally pseudocoded.


#### What methods did you use to iterate through the content? Did you find any good ones when you were refactoring? Were they difficult to implement?

In our initial solution, we used only Array#each and Hash#each. Using #each forced us to write multi-line if-blocks to perform the actions necessary at each step of the method.

Our refactored solution uses several hash methods and one enumerable method that were new to me:

* **Hash#select**: returns a new hash for which the block evaluates to _true_.
* **Hash#keys**: returns the keys of the hash in an array.
* **Hash#values**: returns the values of the hash in an array.
* **Enumerable#max**: returns the object in the enumerable with the maximum value.


Implementing the refactored solution was difficult to implement in that it there is so much going on in so few lines that it's difficult even for me to understand when I re-read it. In all honesty, I'm still a slightly fuzzy about _why_ our refactored solution works, though I know that it does. I need to spend some time carefully parsing all four methods that it calls, to review what it's doing in what order, to follow the logic.

This actually gets to a concern that I've had about the Rubyist tendency to try to do as much as possible in a single line of code. When you have four method-calls in a single line, you're really pushing the point at which the goal of writing concise code begin to conflict with the goal of writing readable code. Our refactored solution is certainly more efficient in terms of lines of code, but I'm not sure it's better in terms of maintainability and reusability.


