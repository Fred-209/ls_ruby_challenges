# frozen_string_literal: true

# Create a clock that is independent of date.
#
# You should be able to add minutes to and subtract minutes from the time represented
# by a given clock object. Two clock objects that represent the same time should be equal to each other.
#
# You may not use any built-in date or time functionality; just use arithmetic operations.
#
# Rules/Requirements
# - do not use build in date or time functionality
# - clock objects with the same time should be equal to each other
#
# Based on Test Cases:
# - Need Clock class
# - clock has a Clock::at method that takes an integer as an argument
#   - optional second integer
#   - first integer is hours, second integer is minutes
#   - this method PROBABLY returns self (clock object) and sets some
#   - ::at is a class method, so a Clock object will need to be instantiated here.
# - need a #to_s method that returns a string
#   - returned string should represent hte time in 24 hour format, ala '11:00'
# - need a #- and #+ method to subtract/add given minutes to the set time
# need a '==' method to ccompare Clock objects against each other based on their hours
# and minutes
#
#==
# - takes one argument, `other` and compares self.to_s to other.to_s for equality
#   #to_s
#   - returns a string of "HOUR:MINUTES"
#
# + and - instance method(total_min_to_add)
# - both take integer as an argument, to represent min to add or subtract
# - get divmod of total_min_to_add, save as hours_to_add, min_to_add
# - Increment `hours` instance variable by result of hours_to_add mod 24
# - If min_to_add + `minutes` is > than 59
#   - increment hours by 1
# - increment `minutes` by min_to_add and then mod that by 60
#
#- (minutes to subtact)
# - get the divmod of hours_to_subtract, min_to_subtract from given integer
#   - assign as hours_to_subract, min_to_subtract
# - decrement @hours by hours_to_subtract
# - decrement @minutes by min_to_subtract
# - if @minutes is negative:
#   - reassign @minutes to be equal to 60 - the abs of @minutes
#   - decrement @hours by 1
# - if @hours is negative
#   - reassign @hours to be the result of subtracting the abs of @hours from 24
#
# Brainstorming:
# - to add time in minutes to a clock time
#   - add minutes given to current minutes
#   - dividing this by 60 (integer div) would yield the number of hours that need to be added
#   - using divmod(60) would give hours, minutes to add to respective hours and minutes
#   - if adding hours to hours goes over 24, then need to reset at 0 hour and continue counting
#     upwards
#     - can add new hours to old hours, then mod the result of this by 24 to get the new
#     value hours should be set to
#     - For minutes, if new_minutes + old minutes is greater 59, then need to increment hours by 1
#     to account for this rollover, then add mod the minutes by 60
#

class Clock
  attr_accessor :hour, :minutes

  def self.at(hour, minutes = 0)
    clock = new
    clock.hour = hour
    clock.minutes = minutes
    clock
  end

  def +(min)
    hours_to_add, minutes_to_add = min.divmod(60)
    @hour += hours_to_add % 24
    @minutes += minutes_to_add

    if @minutes > 59
      @minutes = @minutes % 60
      @hour += 1
    end

    @hour = @hour % 24 if @hour >= 24
    self
  end

  def -(min)
    hours_to_subtract, minutes_to_subtract = min.divmod(60)
    @hour -= hours_to_subtract % 24
    @minutes -= minutes_to_subtract

    if @minutes.negative?
      @minutes = 60 - @minutes.abs
      @hour -= 1
    end

    @hour = 24 - @hour.abs if @hour.negative?
    self
  end

  def to_s
    format('%02d:%02d', hour, minutes)
  end

  def ==(other)
    to_s == other.to_s
  end
end
