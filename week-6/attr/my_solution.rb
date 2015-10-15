#Attr Methods

# I worked on this challenge by myself.

# I spent 2 hours on this challenge.

class NameData
  attr_reader :name
  @name = "Jeff"
end


class Greetings

  def initialize
    @name = NameData.new
  end

  def hello
    puts "Hello, Jeff. How are you today?"
  end

end

greet = Greetings.new
greet.hello



=begin

# Reflection ==================================================================

Release 1 ---------------------------------------------------------------------
What are these methods doing?
How are they modifying or returning the value of instance variables?

In this release, we create class, Profile, and give it intial values for
instance variables @age, @name, and @occupation. We then create a
Profiles#print_info method that prints several lines of formatted text that
report the current value of the instance variables. Then we create a series
of class methods that let us return the current value of each instance variable
(Profile#what_is_...), and modify the value of each instance variable
(Profiles#change_my_...). It is worth noting that because these are all class
methods of the Profile class, we call them on the Profile object we want to
learn about or change. So, when we wanted to change the value of the @age
variable, we had to enter:

instance_of_profile.change_my_age = 28

We can't just call #change_my_age without giving it a receiver object of the
Profile class, because Ruby has no #change_my_age method in its standard
libraries--which is where it would look for any method that is not called
on a specified receiver object.


Release 2 ---------------------------------------------------------------------
What changed between the last release and this release?
What was replaced?
Is this code simpler than the last?

In this release, we've added the line "attr_reader :age" just before the
#initialize method, and deleted the definition of the #what_is_age method.
When we make :age an attribute reader (attr_reader), Ruby automatically
creates a Profile class method by the name of Profile#age, which returns the
value of the instance variable, @age.

This code is simpler than that in the previous release for two reasons: First,
it's just shorter--one line instead of three. And second, it gives us a
concise list of instance variables, right at the top of the class defintion,
which can be reported by instances of the class to the outer program as a
whole, using a simple and obvious method call. (It happens that so far, that
list is only one variable long, but I expect it will grow over the next few
releases.)


Release 3 ---------------------------------------------------------------------
What changed between the last release and this release?
What was replaced?
Is this code simpler than the last?

Now we've added the line "attr_writer :age" at the top of the class definition
for Profile, immediately after the "attr_reader :age" line. We've also deleted
the definition of the method, Profile#change_my_age, which is no longer
necessary. Adding "attr_writer :age" tells Ruby to create a class method,
Profile#age=, which lets us reset the value in the instance variable @age when
we call it on a Profile object.

This code is simpler than before for the same reasons as in the previous
release: It's more concise to code, more convenient to find, and easier to
use, since it follows a predictable format common to all instance-variable-
resetting methods created by "attr_writer" definitions.


Release 6 ---------------------------------------------------------------------

What is a reader method? ------------------------------------------------------

A reader method is a special method included in class definitions that allows
instances of that class to report the current value of an instance variable
when the name of the variable is used as a method call on the instance. This
is easier to demonstrate than to explain:

By including the reader method, "attr_reader :address", in the definition for
the class Student, we allow the program to ask a student object (eg,
"jones_jarvis") for its address using the following syntax:

jones_jarvis.address
=> "123 Fourth St., Fivetown, NY"


What is a writer method? ------------------------------------------------------

A writer method is similar to a reader method, except that it allows us to
manipulate the value of the named instance variable. Continuing with the
Student example above, adding "attr_writer :address" to the Student class
definition allows us to input a new address for a student object:

jones_jarvis.address = "456 Seventh St., Fivetown, NY"
=> "456 Seventh St., Fivetown, NY"


What do the attr methods do for you? ------------------------------------------

Attr methods make a class definition clearer, more concise, and more
consistent in format and function with other classes, by standardizing the
means of reading and writing available instance variables.


Should you always use an accessor to cover your bases? Why or Why not? --------

Including an attr_accessor method for all instance variables within a class
definition might seem like a way to plan ahead, in case you decide later on
that you need to read or write to those variables. However, including accessor
methods that are never needed by the program leaves the variables they access
vulnerable to deliberate or inadvertant reading or writing by parts of the
program (or other programs) that you don't _want_ to access them.

Including accessor methods "just in case" is a lot like leaving a tray of
sandwiches out on the lawn in case you later decide to have a picnic. You
might actually have a picnic some time, but you are quite likely to find those
unguarded sandwiches in a different state than you left them: chewed on,
spoiled, ant-infested, or just plain gone. It's better to put those sandwiches
out only if you are sure you're going to be needing them for a picnic that
you're certain is going to happen.


What is confusing to you about these methods? ---------------------------------

These methods seem pretty clear to me, and consistent with the spirit and
syntax of Ruby that we've learned up to this point.


=end
