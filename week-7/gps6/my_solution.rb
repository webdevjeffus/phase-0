# Virus Predictor

# I worked on this challenge with Andrew Blum.
# We spent 1.25 hours on this challenge, not including independent reflections.

# EXPLANATION OF require_relative
# "relative" directs the program to import code from the indicated .rb file.
# "relative" needs a path as well as a filename. Here, we could substitute:
#     require './state_data'
# "require_relative" indicates that the desired file is in the same directory
#     as the program file.


# GPS SESSION REFACTORED SOLUTION =============================================

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



# SOLO REFACTORED SOLUTION ( further refactoring after GPS session) ===========

require_relative 'state_data'

class VirusPredictor

  # Create new VirusPredictor instance for the given state
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end


  def report_mortality_spread
    puts "#{@state} will lose #{@predicted_deaths} people in this outbreak, which will spread across the state in #{@speed_of_spread} months.\n"
  end

  def report_mortality
    puts "#{@state} will lose #{@predicted_deaths} people in this outbreak.\n"
  end

  def report_spread (speed)
    puts "The outbreak will spread across #{state} in #{@speed_of_spread} months.\n"
  end




  def virus_effects
    print_report(predicted_deaths, speed_of_spread)
  end


  private # Private methods can't be called from outside the class

  # Calculate the predicted deaths, based on population and density
  # (Before refactoring, this method also printed a report to the console)
  def predicted_deaths # returns predicted loss of population
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


#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.report_mortality

=begin
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
=end


# Create and print VirusPredictor instances for all 50 states

STATE_DATA.each do |state, state_data|
  state = VirusPredictor.new( state, state_data[:population_density], state_data[:population] )
  state.virus_effects
end


#=======================================================================
# Reflection Section
