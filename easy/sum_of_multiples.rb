=begin
Write a program that, given a natural number and a set of one or more other numbers, 
can find the sum of all the multiples of the numbers in the set that are less than 
the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that
 are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of 
 these multiples is 78.

Rules/Requirements:

input: integer and set of one or more numbers
output: integer

- given an integer and a possible set

- 



Brainstorming: 
- need to find all multiples from the given set (or 3 and 5 if not given a set) that 
are less than the given number.
- These need to then be summed and this is the ultimate return value from the `to` method
- Can iterate over a range from smallest number in set through 1 less than given number
  - test each number in iteration to see if it is a multiple of any number in the set
- use multiple_of_any? helper method that takes an array and a number to test to see 
if any number in the array is a multiple of the second given number
- if multiple_of_any? is true, add current number to a build array
- once iteration has completed ove this range, sum the build array and return it
in the `to` method


#multiple_of_any?(array, number)
if any number in the array can be divided by number with no remainder, return true
otherwise return false



=end

class SumOfMultiples
  def initialize(first_num = 3, second_num = 5, *others )
    @number_set = [first_num, second_num] + others
  end

  def self.to(limit_num)
    new.to(limit_num)
  end
  
  def to(limit_num)
    smallest_num_in_set = number_set.min

    (smallest_num_in_set...limit_num).select do |number|
      multiple_of_any?(number_set, number) && number < limit_num
    end
    .sum
  end

  private

  attr_reader :number_set

  def multiple_of_any?(group, number)
    group.any? { |member| number % member == 0 }
  end
end

