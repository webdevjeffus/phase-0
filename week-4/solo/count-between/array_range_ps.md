# Pseudocode for count_between challenge
**by Jeff George, 10.2.15, for DBC Phase 0, Ch. 4.6.6**

### Instructions

count_between is a method with three arguments:
* An array of integers
* An integer lower bound
* An integer upper bound

It returns the number of integers in the array between the lower and upper bounds,
including (potentially) those bounds.

If +array+ is empty the method should return 0

### Pseudocode

```
def count_between(list_of_integers, lower_bound, upper_bound)

  IF list_of_integers is empty, RETURN 0

  VARIABLE to count ints in range

  FOR EACH integer in list

    IF integer is as big or bigger than lower_bound AND
                  as small or smaller than upper_bound

      ADD 1 to count of ints in range

    END if check

  END for each check

  RETURN count of ints in range

end

