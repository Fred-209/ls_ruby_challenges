=begin

implement octal to decimal conversion. Given an octal input string, your program should 
produce a decimal output. Treat invalid input as octal 0.


input: integer
output: octal integer

Rules/requirements
- convert a given number to octal
- Ocatal means that each digit of the given number neesd to be multiplied by 8 to the power 
of X, where X is the digit position from left to right, Ones is 1, tens, is 2, etc
  - so digit in the ones places needs to get multipled by 8**0
  - tens digit gets multipled by 8**1, etc
  - the sum of these digits is octal 
- valid octal numbers only include digits 0-7
Based on Test Cases:
- Need an Octal class that takes one argument, a string
  - class has an instance method 'to_decimal' that returns an integer
  - this method converts the given string octal number into a decimal number
- if the string is an invalid number, to_decimal should return 0

Octal class
constructor: 
- takes one string argument and saves it as instance variable, `octal'

#to_decimal 
- takes no argument
- should use the `octal` instance variable
- returns 0 if `octal` includes anything except chars 0-7
- Converts `octal` to a decimal number

  Examples:
  Look to provided test case file

Data Structure
Initialiy given a string, this needs to be converted to an integer
- an array of the digits to make up the given string/number

Brainstorming/Algorithm
- if given string contains anything but the chars 0-7, return 0
- Convert `octal` to an array of digits
- iterate over this array with index, using transformation
  - multiply current `number` by 8**index
    - let this be return value to transform element 
- sum this array, return it

=end

class Octal
  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if @octal.match?(/[^0-7]/)

    octal.to_i.digits.map.with_index { |digit, power| digit * 8**power}.sum
  end

  private

  attr_reader :octal
end


