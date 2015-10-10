

## Specs

In this challenge, you will make your own method to automatically create accountability groups from a list of names. You'll want to make of the People in your cohort. Try to get everyone into an accountability group of 4 or 5. Be sure everyone is in a group of at least 3. This is a creative challenge and you can make it as easy or difficult as you would like. Decide what an MVP (Minimum Viable Product) will look like and what the output should be. This is part of the challenge.

#### Optional features
* If you run this program three times in a row, will the program give you three different outputs?
* Should the program store past outputs?
* If one person were to leave the cohort, how would the accountability groups change?
* How do you decide when you're done? You'll need to decide. This is much more challenging than you probably think, especially since there are no pre-written tests.

## Pseudocode

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
