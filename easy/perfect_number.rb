# frozen_string_literal: true

# The Greek mathematician Nicomachus devised a classification scheme for natural
# numbers (1, 2, 3, ...), identifying each as belonging uniquely to the categories of abundant,
# perfect, or deficient based on a comparison between the number and the sum of its
# positive divisors (the numbers that can be evenly divided into the target number
#   with no remainder, excluding the number itself). For instance, the positive
#   divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.
#
#     Perfect numbers have an Aliquot sum that is equal to the original number.
#     Abundant numbers have an Aliquot sum that is greater than the original number.
#     Deficient numbers have an Aliquot sum that is less than the original number.
#
# Examples:
#
#     6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
#     28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
#     15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9
#     which is less than 15.
#     24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12
#     and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
#     Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.
#
# Write a program that can tell whether a number is perfect, abundant, or deficient.
#
# input: integer
# output: string ('perfect', 'abundant', 'deficient')
#
# Rules/Requirement:
# - Aliquot sum is the sum of a number's positive divisors
# - A number can be perfect, deficient, or abundant based on it's Aliquot sum
#   - perfect: sum is equal to original number
#   - deficient: sum is less than original number
#   - abundant: sum is greater than original number
# - prime numbers are always deficient because their only divisor is one
#
# Based on Tests provided:
# - need a PerfectNumber class
#   - this class needs to have a PerfectNumber::classify method
#     - this method takes an integer and returns one of the three Aliquont classifications
#     - if given a negative number, should raise a StandardError
# -no initialize method needed as nothing in constructor in test cases
# - classify is a class method, not instance method
#
# Examples:
# Look at provided test cases
#
# Data Structure:
# - possibly an array to store a list of divisors of given number
# - string to return
#
# Brainstorming:
# - need to find all positive divisors of given number
# - Can just find positive divisors up to the square root, if you make sure not to add
# any repeats
#   - use helper method get_divisors to calculate all divisors of given number
# - find sum of divisors then compare them to the given number
#   - if equal, number is 'perfect'
#   - if less than, 'deficient'
#   - greater than, 'abundant'
#
# PerfectNumber class
# - needs one class method 'classify' and helper class method 'calculate_divisors'
#
# PerfectNumber::calculate_divisors
# - takes one integer argument
# - create empty array `divisors`
# - Iterates over a range from 1 through sqrt of argument
#   - divide argument by each number in iteration `divisor`
#     - if remainder is 0:
#       - add quotient and `divisor` to `divisors` array
# - delete argument from `divisors` array
# - remove any duplicates from divisors and return
#
# PerfectNumber::classify
# - takes one argument, integer
# - raise StandardError if given integer is negative
# - If given integer is a prime number, return 'deficient'
# - call PerfectNumber.calculate_divisors, save as `divisors`
# - sum all numbers in `divisors` array
#   - for sum:
#     - return 'perfect' if equal to given argument
#     - return 'deficient' if less than given argument
#     - return 'abundant' if greater than given argument

require 'prime'

class PerfectNumber
  def self.classify(number)
    raise(StandardError.new, 'Number must not be negative') if number.negative?
    return 'deficient' if Prime.prime?(number)

    divisors = calculate_divisors(number)

    case divisors.sum <=> number
    when -1 then 'deficient'
    when 0 then 'perfect'
    when 1 then 'abundant'
    end
  end

  def self.calculate_divisors(dividend)
    divisors = []

    (1..Math.sqrt(dividend).floor).each do |divisor|
      quotient, remainder = dividend.divmod(divisor)
      divisors << quotient << divisor if remainder.zero?
    end

    divisors.delete(dividend)
    divisors.uniq
  end
end
