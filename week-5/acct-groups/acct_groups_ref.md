# Accountability Groups Challenge 5.6
**by Jeff George, 10/12/15, for DBC Phase-0**

## Specs

In this challenge, you will make your own method to automatically create accountability groups from a list of names. You'll want to make of the People in your cohort. Try to get everyone into an accountability group of 4 or 5. Be sure everyone is in a group of at least 3. This is a creative challenge and you can make it as easy or difficult as you would like. Decide what an MVP (Minimum Viable Product) will look like and what the output should be. This is part of the challenge.

#### Optional features
* If you run this program three times in a row, will the program give you three different outputs?
* Should the program store past outputs?
* If one person were to leave the cohort, how would the accountability groups change?
* How do you decide when you're done? You'll need to decide. This is much more challenging than you probably think, especially since there are no pre-written tests.

## Pseudocode
```
def create_acct_groups(list)

  CREATE (or import) student list
  COUNT students on list

  DETERMINE number and size of groups

    IF number of students / 5 leaves no remainder
      CREATE array of groups of 5 equal to num of students / 5
      BREAK to ALLOCATE
    ELSE IF number of students / 5 leave a remainder
      CREATE array of groups of 5 equal to (num of students / 5) +1
      SET size of last group to num of students % 5
      IF (last group's size == 1)
        SUBTRACT one member from next-to-last group
        SUBTRACT one member from second-to-last group
        SUBTRACT one member from third-to-last group
      ELSE IF last groups size == 2
        SUBTRACT one member from next-to-last group
        SUBTRACT one member from second-to-last group
        ADD two members to last group
      ELSE IF last group's size == 3
        SUBTRACT one member from next-to-last group
        ADD one member to last group
      ELSE last group's size == 4, break to ALLOCATE
      END IF/ELSE
    END IF/ELSE

  ALLOCATE students from list to groups

end
```

## Initial solution
```ruby
def create_acct_groups(list)

  groups = allocate(list.shuffle)
  balance_groups(groups) if groups[-1].length % 5 != 0
  return groups
end


def allocate(list)
  groups = []
  group = 0

  until list.length <= 0
    groups << []

    for i in 0..4
      groups[group][i] = list.shift if list.length > 0
    end

    group += 1
  end

  return groups
end


def balance_groups(groups)
  shift_member(groups, -2, -1) if groups[-1].length  <= 3
  shift_member(groups, -3, -1) if groups[-1].length  <= 3
  shift_member(groups, -4, -1) if groups[-1].length  <= 3
end


def shift_member(groups, grp_from, grp_to)
  groups[grp_to] << groups[grp_from].pop
end


def print_groups(groups)
  puts
  puts "COPPERHEADS ACCOUNTABILITY GROUPS"
  puts "================================="
  puts "Number of students: " + groups.flatten.length.to_s
  puts "Number of groups: " + groups.length.to_s

  for i in 1..groups.length
    puts "================================="
    puts "Accountability Group " + i.to_s
    puts groups[i-1].length.to_s + " members"
    puts "---------------------------------"
    puts groups[i-1]
    puts
  end
end
```

## Refactored Solution
```ruby
def create_acct_groups(list)
  groups = list.shuffle.each_slice(5).to_a
  balance_groups(groups) if groups.length > 1 && (1..3).include?(groups[-1].length % 5)
  return groups
end


def balance_groups(groups)
  if groups.flatten.count >= 12
    shift_member(groups, -2, -1) if groups[-1].length  <= 3
    shift_member(groups, -3, -1) if groups[-1].length  <= 3
    shift_member(groups, -4, -1) if groups[-1].length  <= 3
  else # Special cases for small lists requiring groups of 3
    shift_member(groups, -2, -1) if [6, 7, 8, 11].include? groups.flatten.count
    shift_member(groups, -2, -1) if groups.flatten.count == 6
    shift_member(groups, -3, -1) if groups.flatten.count == 11
  end
end


def shift_member(groups, grp_from, grp_to)
  groups[grp_to] << groups[grp_from].pop
end


def print_groups(groups)
  puts
  puts "COPPERHEADS ACCOUNTABILITY GROUPS"
  puts "================================="
  puts "Number of students: " + groups.flatten.length.to_s
  puts "Number of groups: " + groups.length.to_s

  for i in 1..groups.length
    puts "================================="
    puts "Accountability Group " + i.to_s
    puts groups[i-1].length.to_s + " members"
    puts "---------------------------------"
    puts groups[i-1]
    puts
  end
end
```

## Test Case
_Used for both Initial and Refactored Solutions_
```ruby
copperheads = [
  "Joshua Abrams", "Syema Ailia", "Kris Bies", "Alexander Blair", "Andrew Blum",
  "Jacob Boer", "Steven Broderick", "Ovi Calvo", "Danielle Cameron", "Eran Chazan",
  "Jonathan Chen", "Un Choi", "Kevin Corso", "Eric Dell'Aringa", "Eunice Do",
  "Ronny Ewanek", "John Paul Chaufan Field", "Eric Freeburg", "Jeff George", "Jamar Gibbs",
  "Paul Gaston Gouron", "Gabrielle Gustilo", "Marie-France Han", "Noah Heinrich", "Jack Huang",
  "Max Iniguez", "Mark Janzer", "Michael Jasinski", "Lars Johnson", "Joshua Kim",
  "James Kirkpatrick", "Christopher Lee", "Isaac Lee", "Joseph Marion", "Kevin Mark",
  "Bernadette Masciocchi", "Bryan Munroe", "Becca Nelson", "Van Phan", "John Polhill",
  "Jeremy Powell", "Jessie Richardson", "David Roberts", "Armani Saldana", "Chris Savage",
  "Parminder Singh", "Kyle Smith", "Aaron Tsai", "Douglas Tsui", "Deanna Warren",
  "Peter Wiebe",
  "Daniel Woznicki",
  "Jay Yee",
  "Nicole Yee",
  "Bruno Zatta"
]

acct_groups = create_acct_groups(copperheads)

print_groups(acct_groups)
```


## Reflection Questions

#### What was the most interesting and most difficult part of this challenge?

There were three interesting, difficult parts to this challenge. In creating my initial solution,
the main challenge was designing an algorithm and writing methods that would divide a large group into several teams of exactly 4 or 5 people, no more, no less. My initial solution handled this by setting up groups of 5, then checking the size of the last group. If the last group was smaller than 4, I shifted one person from other 1, 2, or 3 groups into the last group until the last group also had 4 people. The initial solution worked perfectly for lists of 12 or more people, but it failed for certain numbers below 12 (specifically, 1, 2, 3, 6, 7, and 11). Still, since it handled any size close to the DBC cohort, I considered this an acceptable MVP.

The other two challenges arose in crafting the refactored solution. My first refactoring challenge was replacing my 12-line #allocate method, which included not one but TWO loops, with better, more specialized methods. I learned about #each_slice on other challenges during the week, and realized it was probably the key to cutting the #allocate method way down. In the end, using #each_slice(5).to_a allowed me to eliminate the #allocate method completely, replacing it with a single line of code.

The other challenge in refactoring was handling allocation of people to acct. groups when the total list was very small. In the initial solution, #balance_groups was called on all lists except those divisible by 5. In the refactored solution, I adjusted the if-conditional on the #balance_groups call to not balance groups if there was only one group (which handled the failures on lists of 1, 2, and 3), nor on lists when the final group had 4 members. Within #balance_groups, I kept the original algorithm for balancing groups when there were 12 or more people on the class list. For lists of less than 12, I figured out the shifts that would have to take place to balance groups of 6, 7, 8, and 11, and wrote them into an else case in #balance_groups.

In the submitted version of the program, I have left the code from the initial solution in place, commented out, with notes explaining the changes.


#### Do you feel you are improving in your ability to write pseudocode and break the problem down?

My initial solution follows my pseudocode pretty closely, so I am feeling pretty comfortable with my ability to plan an initial solution. I don't usually go back to the pseudocode drawing board when refactoring, though; instead, I make tiny changes, one at a time, in the working code, so that I'm
never more than one commit from a working version of the code.


#### Was your approach for automating this task a good solution? What could have made it even better?

I think my solution does a very good job of automating the random allocation of any number of people to teams of 4 or 5 people, and printing out the list in an attractive format. I'd hoped to learn how to take the list in from a file, and save the allocated teams to a file, and to add and remove people to the list without disrupting the groups, but I simply didn't have time to learn to read and write to files this week.


#### What data structure did you decide to store the accountability groups in and why?

The original list of students is stored as a one-dimensional array, and the final list of groups is stored as two-dimensional array, in which the outer array holds the teams, and the inner arrays hold the members of each team. Since the groups are identified by number, they can be accessed by integer indices, making it unnecessary to use a hash with keys to hold the team arrays.


#### What did you learn in the process of refactoring your initial solution? Did you learn any new Ruby methods?

The methods I used for the first time in this challenge include:
* #each_slice
* #shuffle
* #include?
* #flatten
* #count
* #pop
* <<
