# frozen_string_literal: true

#
# Write some code that converts modern decimal numbers into their roman number
# equivalents
#
# Roman numeral conversions:
#
# I = 1
#
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000
#
# 1 = I
# 2 = II
# 3 = III
# 4 = IV
# 5 = V
# 6 = VI
# 7 = VII
# 8 = VIII
# 9 = IX
# 10 = X
# 20 = XX
# 30 = XXX
# 40 = XL
#
#
# Number ranges:
# 1
# 10 - 49
# 50 - 99
# 100 - 499
# 500 - 999
# 1000 - 3000
#
# 100 + 40 + 1
# c + XL + I
#
# 40 + 8
# XL + VIII
#
# 445
# 400 + 40 + 5
# CD + XL + V
#
#
# Rules/requirements:
#  -Need a RomanNumerals class based on test cases
#   - this class is passed an integer on creation
#     - this number is the integer to convert to a roman numeral
#   - need a RomanNumeral#to_roman that converts constructor argument into a roman numeral
# - 0's are not used, need to discard those
#
# RomanNumeral class:
# constructor:
# input: 1 argument, integer
# - saves this number as `number` instance variable
#
# to_roman
# - converts @number to a roman numeral
# - uses @decimal_number from RomanNumeral class
#- Convert this number to an array of it's expanded form digits
# - convert the number into an array of it's digits (use Integer#digits)
# - Transform the numbers in this digit array using  map and with_index:
#   - `number` and `power``
#   - The block should convet each digit to its expanded form
#   - multipy each `number`` by 10 * `power`
# - Again call `map` on this array to transform each expanded number to its
# roman numeral equivalent - reverse it first as `digits` left it with least
# significant digit first
#   - The block should return each number's associated value from the CONVERSION_CHART
#   hash
# - join this array of roman numerals into a string and return it

#
# I = 1
#
# V = 5
# X = 10
# L = 50
# C = 100
# D = 500
# M = 1000

class RomanNumeral
  CONVERSION_CHART = {
    1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 6 => 'VI', 7 => 'VII',
    8 => 'VIII', 9 => 'IX', 10 => 'X', 20 => 'XX', 30 => 'XXX', 40 => 'XL',
    50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 90 => 'XC', 100 => 'C',
    200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D', 600 => 'DC', 700 => 'DCC',
    800 => 'DCCC', 900 => 'CM', 1000 => 'M', 2000 => 'MM', 3000 => 'MMM'
  }.freeze

  attr_reader :decimal_number

  def initialize(number)
    @decimal_number = number
  end

  def to_roman
    decimal_number.digits.map.with_index do |digit, power|
      digit * 10**power
    end
                  .reverse
                  .map { |number| CONVERSION_CHART[number] }
                  .join
  end
end
