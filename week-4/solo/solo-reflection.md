# Reflection: Arrays and Hashes
**by Jeff George, 10.2.15, for DBC Phase 0, Ch. 4.6**

#### What does it mean to iterate over an array?

To iterate over an array means to perform the same action on every member of that array, in sequence. That action may be as simple as counting the each member, or as complex as running several methods upon them. But what makes it iteration is that whatever the action it, it is performed on each member of the array, once and once only, in sequence.


#### How are arrays structured? What can they contain?

An array is structured as an ordered list of objects; each member of the array can be accessed by an index number specifying its position in the sequence of objects in the array. Note that array indexes start counting at 0. For example, in the array of integers **[ 1, 18, 9, 32 ]**, the object at index **2** is the integer **9**. The syntax for accessing a value in an array by index is **array_name[index_num]**, as in **my_array[3]**.

An array in Ruby can contain objects of any type, including strings, integers, hashes, symbols, and even arrays (creating data tables with two or more dimensions). The objects in an array do not have to be of the same type; a single array can contain objects of any number of types.


#### Based on what you've learned, what is the best way to access values in a hash?

The values stored in a hash are most easily accessed in a manner very similar to that used to get at the values in an array, using the name of the hash, followed by the name of the key inside square brackets. For example, if you have a hash **books_by_author**, you would access the books by a given author by naming the hash, followed by the key (an author's name in this case) inside brackets:

```
books_by_author[ :tolkein ]
```

which might return the string _"Lord of the Rings"_.


#### What are some important things to remember about hash keys and uniqueness?

Hash keys must be unique within the hash; you can't have two **:hometown** keys in a single hash. If you need to store multiple values for a single key, have the value for that key be an array:

```
books_by_author[ :king ] = [ "It", "Cujo", "The Stand", "Carrie" ]
```


#### What are the main differences between arrays and hashes? When do you think one will be better over the other?

The key difference between arrays and hashes is that the values in an array are accessed by numeric indexes, while the values in a hash are accessed by named keys.

An array is likely to be most useful when you are storing a list of similar objects, especially if members of that list are likely to be removed, added, filtered, sorted, or re-ordered. The Array object type has built-in methods to accomplish all of those operations. The values in an array can be easily accessed by their index number, their length, their alphanumeric order, or as sequential subsets (slices), so it's best (but not required) that they be similar in type and nature. For example, if you had a list of cities in a state, it might be well represented by an array, such as:

```
AZ_cities = [
  "Phoenix",
  "Scottsdale",
  "Tempe",
  "Flagstaff",
  "Yuma",
  "Wickenburg"
]
```

A hash, on the other hand, is a set of key-value pairs. It is best suited to storing varied data relating to a specific topic, in a collection of similar sets (which suggests an array to hold the hashes...hmmm). For example, you might have more data than just names on each of those cities in Arizona; you could store the data for each city in a similar hash, within the **AZ_cities** array:

```
AZ_cities[0] = {
  :name => "Phoenix",
  :pop => 1445632,
  :elev_ft => 1082,
  :founded => 1867
}
```

Then, to access the information in the hash AZ_cities[0], you'd use two sets of brackets, such as:

```
AZ_cities[0][ :pop ]
```

which would return the value 1445632.

