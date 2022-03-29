
#
# Create a class that can take create Meetup objects.
#
# Rules/Requirements:
#
# input:
# constructor - integers of year and month number
# day - takes two strings consisting of following
#   - first, second, third, fourth, fifth, last, teenth
#   - these input strings describe a particular day in relation to a month that
#   is also given
#   - second argument would consist of a day of the week, one of the following:
#     - Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
#
# day method should outout a date object returned by calling Date.civil with the
# correct year, month, and day
#   - Date.civil takes integers as arguments: Year, Month, Day
#
# - teenth is a madeup word, and means any of the days of a month from 13th-19th
# - letter casing is not important ie: 'fIrst' should be the same as 'FIRST', 'first'
#
# Questions:
# Assume that all entered arguments to #day are valid days of that particular month?
#
#
# Brainstorming/Ideas:
# - Use Date.new with the passed year and day integers to create a new Date object
# - can call prediciate days of the week on this like friday? sunday? etc and will return
# boolean result
# - can call + or minus on a Date object to increase/decrease the day
# - can call `day` on a Date object to return the day of the month, ie: 5th
# - can call wday on a Date object to return an integer representing day of the week, where sunday
# is 0 and saturday is 6
# - until calling wday on date object is equal to the integer that represents the target
# day, ie monday is 1, then call 'succ' on the date to increment it until it reaches target
# - #day could have a hash that maps days of week in format 'Monday' as keys to 0-6 integers as their values
#   - this would be the 'first' of that day in the month, ie: first 'Monday'
# - cann add 7 to date object to increase it by week
# - if target day occurrence is 'first', this is the date ovject to return
# - if target occurrence is 'second', increment day by 7, 14 for 'third', 21 for '4th', 28 for 5th
#
# - to figure out 'teenth' days
#   - just create a new date object with same year and month, with 13 for the day
#   - Using hash created above to map 0-6 to days of week, call wday on date to see if it matches
#   target day, ie: Monday,
#     - if not, increment Date object by 1 until it does
#     - return this object
#
# - to figure out last occurrence of specific day of the week, create a Date.civil object with year, month,
# and -1 as the day. This sets the date to the last day of the month. Test to see
# if this date matches target day of the week using the hash above and `wday`
#   - If if i'ts not, decrement the date until it does match
#
#
# Examples: SEe test cases for examples
#
# Data Structure
# - hash to map full days of week ('Monday', 'Tuesday', etc) to integer values
# represnting return value of calling `wday` on Date objects
# - Hash to map 'first', 'second'
#
#
# Algorithm
#
# Meetup class
# - needs a Constant WEEKDAY_NUMBER, maps 'Sunday, Monday' etc as keys, 0 - 6 as cooresponding
# integer values
#
# constructor: (2 arguments) integers, year and month
# - assign year and month to instance variables
#
# day method(two string arguments) 'Monday' as weekday, occurence as second 'first, second, teenth, etc'
# - occurrence should be case insensitive
# -
#
# private
#
# numbered_occurence (2 strings), weekday like 'monday', occurence
# is either 'first', 'second', 'third', 'fourth', 'fifth'
# - returns a Date object that is calculated based on the 2 given inputs
# - uses @year and @month
#
# - init date to new Date.civil object with current @year and @month
# - set target_weekday_number to value found in  WEEKDAY_NUMBER hash for `weekday`
# - find wday number of `date`, and if it matches target_weekday_number then this is
# the day of the week we want, and we know we've found the 'first' occurrence of this
# - if it's not, need to loop and increment `date` until calling wday on `date` matches targe
# - so loop until calling wday on `date` is equal to target_weekday_number
# - if occurrence is 'first', return this `date`
#  - else, increment by a specific amount:
#   - when occurrence is 'second', increment 'date' by 7
#   - ....'third', 14
#   - ....' fourth', 21
#   - ....' fifth', 28
#   - return this 'date`
#
#
#
#
#
#
#
#
require 'date'

class Meetup
  WEEKDAY_NUMBER = {
    'sunday' => 0,
    'monday' => 1,
    'tuesday' => 2,
    'wednesday' => 3,
    'thursday' => 4,
    'friday' => 5,
    'saturday' => 6
  }.freeze

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, occurrence)
    weekday = weekday.downcase
    occurrence = occurrence.downcase

    case occurrence
    when *%w[first second third fourth fifth]
      find_numbered_occurrence(weekday, occurrence)
    when 'teenth'
      find_teenth_occurrence(weekday)
    when 'last'
      find_last_occurrence(weekday)
    end
  end

  private

  attr_reader :year, :month

  def find_numbered_occurrence(weekday, occurrence)
    date = Date.civil(year, month)
    target_weekday_number = WEEKDAY_NUMBER[weekday]

    date += 1 until date.wday == target_weekday_number

    case occurrence
    when 'first' then date
    when 'second' then date + 7
    when 'third' then date + 14
    when 'fourth' then date + 21
    when 'fifth'
      date += 28
      date.month != month ? nil : date
    end
  end

  def find_teenth_occurrence(weekday)
    date = Date.civil(year, month, 13)

    date += 1 until date.wday == WEEKDAY_NUMBER[weekday]
    date
  end

  def find_last_occurrence(weekday)
    date = Date.civil(year, month, -1)

    date -= 1 until date.wday == WEEKDAY_NUMBER[weekday]
    date
  end
end
