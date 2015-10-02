# Pseudocode for largest_integer challenge
**by Jeff George, 10.2.15, for DBC Phase 0, Ch. 4.6.1**

_Note: This pseudocode was adapted from my pseudocode for the smallest_integer challenge._

```
def largest_integer(list)

  IF list is empty, RETURN NIL

  ELSE

    VARIABLE largest_num = first num on list
    VARIABLE index = 1

    FOR EACH number in list

      IF number at index is larger than largest_num

        SET largest_num = number at index

      END if check

      INCREMENT index by 1

    END for each loop

    RETURN largest

  END if/else check

END method
