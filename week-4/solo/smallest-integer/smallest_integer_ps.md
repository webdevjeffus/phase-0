# Pseudocode for smallest_integer challenge
**by Jeff George, 10.2.15, for DBC Phase 0, Ch. 4.6.1**


### First version; didn't quite work
```
def smallest_integer(list_of_nums)

  IF list is empty THEN RETURN NIL

  ELSE
    VARIABLE smallest_num = first number in list

    FOR EACH number in list

      IF next number is smaller than this number,

      smallest_num is now next number

    RETURN smallest_num

end
```


### Second version, after refactoring
```
def smallest_integer(list)

  IF list is empty, RETURN NIL

  ELSE

    VARIABLE smallest_num = first num on list
    VARIABLE index = 1

    FOR EACH number in list

      IF number at index is smaller than smallest_num

        SET smallest_num = number at index

      END if check

      INCREMENT index by 1

    END for each loop

    RETURN smallest

  END if/else check

END method
'''