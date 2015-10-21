# Virus Predictor

# I worked on this challenge with Andrew Blum.
# We spent 1.25 hours on this challenge, not including independent reflections.

# EXPLANATION OF require_relative
# "relative" directs the program to import code from the indicated .rb file.
# "relative" needs a path as well as a filename. Here, we could substitute:
#     require './state_data'
# "require_relative" indicates that the desired file is in the same directory
#     as the program file.


# =============================================================================
# ==================== GPS SESSION REFACTORED SOLUTION ========================

require_relative 'state_data'

class VirusPredictor

  # Create new VirusPredictor instance for the given state
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end


  def virus_effects
    print_report(predicted_deaths, speed_of_spread)
  end


  private # Private methods can't be called from outside the class

  # Calculate the predicted deaths, based on population and density
  # (Before refactoring, this method also printed a report to the console)
  def predicted_deaths # returns predicted loss of population
    # predicted deaths is solely based on population density
    case @population_density
    when @population_density >= 200; number_of_deaths = (@population * 0.4).floor
    when @population_density >= 150; number_of_deaths = (@population * 0.3).floor
    when @population_density >= 100; number_of_deaths = (@population * 0.2).floor
    when @population_density >= 50; number_of_deaths = (@population * 0.1).floor
    else number_of_deaths = (@population * 0.05).floor
    end

  end


  # Calculate the speed at which the virus spreads
  # (Before refactoring, this method also printed a report to the console)
  def speed_of_spread # returns rate of spread of virus in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    case @population_density
      when @population_density >= 200 then speed += 0.5
      when @population_density >= 150 then speed += 1
      when @population_density >= 100 then speed += 1.5
      when @population_density >= 50  then speed += 2
      else speed += 2.5
    end

  end


  def print_report (deaths, speed)
    puts "#{@state} will lose #{deaths} people in this outbreak, which will spread across the state in #{speed} months.\n\n"
  end

end


# Driver Code for GPS Session Solution ----------------------------------------

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects
jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects
california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects
alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
# Create and print VirusPredictor instances for all 50 states
STATE_DATA.each do |state, state_data|
  state = VirusPredictor.new( state, state_data[:population_density], state_data[:population] )
  state.virus_effects
end


STATE_DATA.each do |state, state_data|
  state = VirusPredictor.new( state, state_data[:population_density], state_data[:population] )
  state.virus_effects
end
=end


# =============================================================================
# ===== SOLO REFACTORED SOLUTION ( further refactoring after GPS session) =====

require_relative 'state_data'

class VirusPredictor

  # Create new VirusPredictor instance for the given state
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end


  # Report methods - methods that produce VirusPredictor reports

  def report_mortality_spread
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak, which will spread across the state in #{speed_of_spread} months.\n"
  end

  def report_mortality
    puts "#{@state} will lose #{predicted_deaths} people in this outbreak.\n"
  end

  def report_spread
    puts "The outbreak will spread across #{@state} in #{speed_of_spread} months.\n"
  end



  private # Private methods can't be called from outside the class

  # Calculate the predicted deaths, based on population and density
  # (Before refactoring, this method also printed a report to the console)
  def predicted_deaths # returns predicted loss of population in state
    case @population_density
    when @population_density >= 200; number_of_deaths = (@population * 0.4).floor
    when @population_density >= 150; number_of_deaths = (@population * 0.3).floor
    when @population_density >= 100; number_of_deaths = (@population * 0.2).floor
    when @population_density >= 50; number_of_deaths = (@population * 0.1).floor
    else number_of_deaths = (@population * 0.05).floor
    end

  end


  # Calculate the speed at which the virus spreads
  # (Before refactoring, this method also printed a report to the console)
  def speed_of_spread # returns rate of spread of virus across state in months
    speed = 0.0

    case @population_density
      when @population_density >= 200 then speed += 0.5
      when @population_density >= 150 then speed += 1
      when @population_density >= 100 then speed += 1.5
      when @population_density >= 50  then speed += 2
      else speed += 2.5
    end
  end

end


# Driver code for Solo Refactored Solution (post-GPS) -------------------------

=begin

# Test all three VirusPredictor reports on a single state
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.report_mortality
alabama.report_spread
puts "=============="
alabama.report_mortality_spread
puts "=============="

=end

# Create and print VirusPredictor reports for all 50 states

STATE_DATA.each do |state, state_data|
  state = VirusPredictor.new( state, state_data[:population_density], state_data[:population] )
  state.report_mortality_spread
  puts ""
end


# =============================================================================
# ============================ Reflection Section =============================
=begin

# What are the differences between the two different hash syntaxes shown in
the state_data file?

The outer hash, of states, stores its keys as strings, while the inner hashes,
of population data for each state, store their keys as symbols. Storing the
keys in the outer hash as strings makes it convenient to use them in strings
that are printed to the console as reports. Storing the keys in the inner
hashes as symbols saves memory space and processing time.


# What does require_relative do? How is it different from require?

"relative" directs the program to import code from the indicated .rb file.
Used on its own, the basic "relative" needs a path as well as a filename. Out
of curiousity, I tested whether we could call a file in the same directory
using the ./ notation for "current directory," and it worked; thus, it's in
this case to replace "require_relative" with:

     require './state_data'

On the other hand, "require_relative" indicates that the desired file is in
the same directory as the program file, and requires no path.


# What are some ways to iterate through a hash?

There are many ways to iterate though a hash, but for this challenge, we used
the Hash#each method.


# When refactoring virus_effects, what stood out to you about the variables,
if anything?

For one thing, instance variables were being unnecessarily passed into class
methods as arguments; we cut those parameters from the definitions of
predicted_deaths and speed_of_spread, and removed them from the calls to those
methods in virus effects.

We also learned how important it is to name variables clearly when writing
code, so that you can keep track of what you're doing; in creating the driver
code that reports all 50 states' VirusPredictor data, we were struggling to
get our #each method to iterate properly until we changed the names of the
variables passed to the #each code block from "key" and "value" to "state"
and "state_data". With those more contextual names in place, it became much
easier to figure out how to write our references to the data inside the inner
hash necessary to make the #each method perform as intended.


# What concept did you most solidify in this challenge?

The most obvious concept that I internalized in this challenge was the use of
the case statement. I'd seen them before, and understood them conceptually
from prior work with Python, but I'd never written one in Ruby. However, as
Andrew noticed, case statements were exactly what we needed to replace the
chained if/elsif/else sequences in both of the private methods. It took us a
few minutes to work out the Ruby syntax for a case statement, but once we got
it working, we were even more sure it was the right tool for this job.

The other concept that got discussed in our pair session was related to the
principle of Separation of Concerns and modular program design. Separation of
Concerns is the principal that each section of the program should address a
single concern, and address it completely. I felt that as the original code
for this challenge was written, it violated that principle in how it
implemented its #predicted_deaths and #spead_of_spread methods. In my
opinion, each of those methods was handling not one job, but one and a half
jobs: it performed a calculation, then returned _half_ of a report printed to
the console. As the code was written, these methods did not do what their
names promised--return a value resulting from a calculation--but instead
printed only a the first or second half of the report containing those
results. In fact, neither method even returned a complete sentence, which
would have at least made it possible to use them separately if the need arose
down the line. Thus, the two methods were useless unless called together, in
the right order.

Our guide felt that since these were private methods, and the code inluded a
public method that actually did call those two functions together, their
interdependent nature was acceptable. I strongly felt, however, that even if
it was acceptable for them to each print a report that depended on the other
one's report to make sense, they both violated the Separation of Concerns,
because they were handling two distinct functions--calculating and printing--
which limited their usefulness to being called by the one method designed to
call them together and in the right order. I suggested that if we refactored
the code to pull the print statements out of the calculating methods, and
combined them into a #print_report method, our code would be easier to maintain
and more extensible.

The first solution in this file shows our refactoring within the pair session,
with my partner Andrew allowing us to implement my idea for creating the
separate function for printing the report, which was called by the public
#virus_effects. (I'm not sure if Andrew agreed with me, or if he was just
being polite. Either way, he was very kind and cooperative about it, so my
thanks to him for that.) Structuring the code in this way required that we
pass the values returned by #predict_deaths and #speed_of_spread into the
#print_report method as arguments, since those values weren't saved anywhere
as instance variables--a slight bit of klunkiness that I think bothered both
Andrew and myself then, but we didn't have time left to find a better solution
for that problem.

After the pair session concluded, I continued to ponder the structure of this
program, and realized what the problem was: we had a public method,
#virus_effects, whose only purpose was to call a private function,
#print_report. This unnecessary level of indirection is what made it necessary
for us to use the parameters in our definition of #print_report. Working on my
own, I refactored the program further, eliminating the #virus_effects method
entirely, and replacing the private method #print_report with a public method,
#report_mortality_spread. This simplified the code from our prior version, and
made it so that each method in the program was responsible for one and only
one purpose, either performing a calculation _or_ printing an entire, stand-
alone report. To further demonstrate the extensibility of this version, I
added two more public functions: #report_mortality, which prints a report of
_only_ the predicted mortality in the specified state during an outbreak; and
#report_spread, which prints a report of _only_ the anticipated rate at which
the outbreak would spread across the specified state.

I still feel that this final version is the best, most robust, most easily-
maintained, and most extensible version that we produced, because it adheres
closely to the principle of separation of concerns where the original version
did not; and because it eliminates the unnecessary and confusing extra layer
of method-calling we'd introduced in our first refactored version.


=end