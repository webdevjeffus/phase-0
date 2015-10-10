# Die Class 1: Numeric - Ch. 5.7
#### By Jeff George, 10/10/15, for DBC Phase 0

* I worked on this challenge by myself.
* I spent 4 hours on this challenge, including reading and research.



## 0. Pseudocode

**_Input:_** A class to create a die with a specified number of sides.

**_Output:_** A Die class that can report the maximum number it can roll (that is, how many sides it has), and the result of a single roll of that die. The initialization method must raise an exception (error) if asked to create a die with 0 or fewer sides.

**_Steps:_**
```
def Die(num_sides)

  def INITIALIZE a new die object
    IF num_sides < 1
      RAISE argument error
    SET number of sides = num_sides
  end

  def SIDES
    RETURN num_sides
  end

  def ROLL
    RETURN random number in range 1 to num_sides
  end

end
```


## 1. Initial Solution

```ruby
class Die

  def initialize(sides)
    if sides < 1
      raise ArgumentError, "You asked for a die with #{sides} sides. The number of sides on a die must be a positive integer."
    end
    @sides = sides
  end

  def sides
    @sides
  end

  def roll
    rand(@sides) + 1
  end

end
```


## 3. Refactored Solution

_The code in this class definition is so simple, there really isn't any refactoring to do._



## 4. Reflection

#### What is an ArgumentError and why would you use one?

An **ArgumentError** is caused when the arguments passed to a method do not match the parameters included in the method's definition. **ArgumentError**s are commonly raised when a method is passed too many or too few arguments, but it is possible to use the **raise** method to raise an **ArgumentError** to interrupt or abort the program flow for other problems with arguments. In our **Die#initialize** method, we raised an **ArgumentError** if **Die.new** were called with a "sides" argument with a value less than 1.


#### What new Ruby methods did you implement? What challenges and # successes did you have in implementing them?

The two new methods (to me, at least) in this challenge were **#rand** and **#raise**. **#rand** worked exactly as I expected, based on the Ruby docs, so I had no trouble using it. **#raise** also seemed to function as I expected it to, based on my reading in the _Rubyist_, but when I tried to raise an error not just for values for **sides** that were less than 0, but also for non-integer values, my code no longer passed all the RSpec tests. In order to make it work, I had to remove the **is_a? Integer** check from the **#raise** call.


#### What is a Ruby class?

A _class_ is a group of similar objects that share certain characteristics (variables) and behaviors (methods). Every object belonging to a given class is said to be an _instance_ of that class. For example, every instance of the class **Pizza** will have an _instance variable_ that defines its size, which is written as **@size**. Not all pizzas are the same size, though, so each pizza has its own value for **@size**, independent of the sizes of other pizzas...but every instance of the pizza class must have some value for **@size**.

Similarly, if a method is created in the definition for a class, all instances of that class will be able to utilize that method. If our Pizza class has a method, **Pizza#burn_roof_of_mouth**, all pizzas will be able to use that method. So when you take a bite from any given pizza, that method is called (using something like **my_pizza.burn_roof_of_mouth**) to see if it does actually burn the roof of your mouth. The code inside **#burn_roof_of_mouth** might check a boolean instance variable named **@too_hot_to_eat?**; if **@too_hot_to_eat?** returns **true**, the pizza burns your mouth. Ouch!


#### Why would you use a Ruby class?

Ruby classes have a tremendous positive impact on both the logic and the conciseness of a program. Classes improve the logic by assuring that similar items all behave in the same way, and make programs more concise (and therefore maintainable) by eliminating huge quantities redundant code. Classes are a key weapon in the DRYness arsenal.


#### What is the difference between a local variable and an instance variable?

Instance and local variables are similar in that they are both limited in scope&mdash;that is, they are accessible only within the instance, method, or other block in which they were created. But while local variables are lost as soon as their method or block returns a value and concludes, instance variables persist as long as the object they belong to remains in existence.

Instance variables allow each instance of a class to remember its state. In our Pizza class example from above, each pizza has two instance variables, **@size** and **@too_hot_to_eat?**, which allow each pizza to keep track of information about itself. Instance variables are often set when the object is first created, by the **#initialize** method, though they can be added or adjusted later by class methods. Whenever we create a new pizza, for example, we could set the value for its **@size** with an argument to **Pizza.new**, and automatically set the value of **@too_hot_to_eat?** to **true** inside the **#initialize** method. After a certain amount of time, the value of **@too_hot_to_eat?** could be reset to **false**, probably by calling a **Pizza#cool_down** class method that checks an additional **@time_pulled_from_oven** instance variable, that would have also been set automatically at the time the pizza object was created.


#### Where can an instance variable be used?

An instance variable can be used (read, written, or changed) by methods inside the instance that it belongs to, but not by any other code elsewhere in the program. In that sense, instance variables are protected from external meddling. In order to access an instance variable, it is necessary that a class or instance method exist that uses that instance variable. For example, we can't reset a pizza object's value for **@too_hot_to_eat?** directly. We can only get to it if a class or instance variable is defined that lets us do so. In the case of our pizza class, we could call the class method **my_pizza.cool_down** to allow the pizza time to cool down, thus setting **my_pizza**'s instance variable **@too_hot_to_eat?** to false. If we want to make it too hot again, we can's just reset with a direct assignment like **my_pizza@too_hot_to_eat? = true**; we'd need to define and call a **Pizza#reheat** class method to change the value of that instance variable.
