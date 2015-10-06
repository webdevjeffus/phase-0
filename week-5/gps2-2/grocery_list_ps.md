# GPS 2.2: Ruby - Pseudocode for Electronic Grocery List
#### by Jeff George, with guide Gary Sperba
#### (Pair partner was unable to participate in GPS session)

Reflections at end of file.

[Solution as Ruby Code](https://github.com/webdevjeffus/phase-0/blob/master/week-5/gps2-2/gps2_2.rb)


### Create a new list
```
def create_list(name)

  CREATE an empty list as a hash/dictionary

end
```


### Add an item with a quantity to the list
```
def add_item(hash, item, qty)

  IF item is on list
    INCREASE quantity on list by qty


  ELSE (item is NOT on list)
    ADD key to list and SET quantity on list equal to qty

  END "if"

end
```


### Remove an item from the list
```
def remove_item(hash, item)

  DELETE item by key

end
```


### Update (overwrite) quantities for items in your list
(First version; works, but doesn't actually need conditional)
```
def update_item(hash, item, qty)

  IF item is on list
    SET value equal to qty

  ELSE (item is NOT on list)
    ADD key to list and SET quantity on list equal to qty

  END "if"

end
```

(Second version; unnecessary conditional removed)
```
def update_item(hash, item, qty)

  SET value equal to qty

end
```



### Print a formatted version of the list

(Initial version - Very basic, no formatting)
```
def print_list(hash)

  FOR EACH key-value pair in hash

    PRINT key + leader + value

  END EACH LOOP

end
```

(Refactored version - With lined-up columns, rules, header and footer )
```
def leader(width, separator, str_0, str_1)

  SET number of separator chars equal to width - (length of str_0 + length of str_1)

end


def print_list(hash, width)

  PRINT header
  PRINT horizontal rule

  FOR EACH key-value pair in hash

    PRINT key + leader + value

  END EACH LOOP

  PRINT horizontal rule
  PRINT footer

end
```


## REFLECTION QUESTIONS

#### What did you learn about pseudocode from working on this challenge?

My approach to pseudocode has evolved into a hybrid of the format shown in last week's DBC video on pseudocoding and Chris Pine's technique of using commented-out pseudocode as a skeleton for building your initial solution, replacing the lines of pseudocode with real code one at a time. Because I know from the outset that I'm going to directly convert the pseudocode into real code in place, I go ahead and put in a "real" Ruby-language method-definition starting line, and an end, so I don't forget it. In the body of the pseudocode, though, I try to make the explanation as plain-english and programming-language-agnostic as possible. This methodology seems to be basically working, although as I'm finalizing and polishing the program (like adding final formatting touches to the print_list method here), I gradually stop pseudocoding the last few adjustments, and just put enter them as formal Ruby.


#### What are the tradeoffs of using Arrays and Hashes for this challenge?

Arrays would have been wildly inconvenient, because you can't keep your item names and quantities in a single, simple array. You could conceivably keep them in a two-dimensional array (an array of two-item arrays), but accessing them by numerical indexes would have been confusing, and it would have made matching item types for the add_item, remove_item, and update_item methods much more complicated. Hashes, which allow you to store key-value pairs, were perfect for this collection of items and quantities.


#### What does a method return?

Which method are you referring to? But seriously, I know from other reading that a method returns a single object of any data type. It didn't really come up in this challenge, but if I needed a method to return a matching key and value from the list hash, for example, I would have to set it up to return those two objects within a two-item array. This is because a method can return only one object; to get more than one object out, you have to "sneak them out the back door" inside a single array or hash object.


#### What kind of things can you pass into methods as arguments?

You can pass an object of any type into an method as an argument, assuming the parameters were set up appropriately when the method was defined. In this challenge, for example, I have passed hashes, strings, and integers into various methods.


#### How can you pass information between methods?

In general, information is passed between methods using variables, which must live within the scope of all methods that need to access them. In this challenge, we used variables to pass information between methods in two kinds of circumstances. In the case of entirely separate or parallel methods, such as add_item and print_list, information was passed using a hash as a variable local to the main object, upon which all these methods are implicitly called. In the case of methods called from within other methods (nested methods, that is), such as when print_list calls horiz_rule, information is passed from the calling method into the method called as arguments to the method call. (Forgive me if my use of vocabulary isn't perfect in this answer, but I _think_ I've got the right basic idea about methods and variables that belong to main.)


#### What concepts were solidified in this challenge, and what concepts are still confusing?

I'm getting more familiar with Ruby syntax and common methods as we work along. For example, the "each" method was strange to me at first, but now I'm using it pretty easily. I'm also getting more comfortable with the general practice of making code more DRY by writing methods that replace repetitive code and make the program generally more readable. I think you can see this in my refactoring of the print_list method, in which I managed to replace a handful of nearly-identical lines of code with reusable methods.

I really don't have a super-strong handle on hashes yet, though. I feel somewhat more in control of them after completing this challenge than I did before, but there are still aspects of them that are mysterious to me. For example, as I started this challenge, I was trying to use symbols as my keys, but for some reason, they were causing errors I couldn't solve. Gary had me shift to using strings as keys, and amazingly, those errors suddenly disappeared. I would think that the problem was just me, making mistakes with symbol syntax, but Gary said that using symbols as hash keys doesn't always work out. (He may have quickly explained a bit of why this is the case, but I didn't fully understand the reason, and didn't want to stop progress in the challenge to dive into a rabbit hole.) I definitely need to do more reading and more practice with hashes, and their keys and values.
