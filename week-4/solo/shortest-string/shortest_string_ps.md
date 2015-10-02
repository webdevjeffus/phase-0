# Pseudocode for shortest-string challenge
**by Jeff George, 10.2.15, for DBC Phase 0, Ch. 4.6.1**

_Note: This pseudocode was adapted from my pseudocode for the largest_integer challenge._

```
def shortest_string(list)

  IF list is empty, RETURN NIL

  ELSE

    VARIABLE shortest_string = first string on list

    FOR EACH this_string in list

      IF this_string is shorter than shortest_string

        SET shortest_string = this_string

      END if check

    END for each loop

    RETURN shortest_string

  END if/else check

END method