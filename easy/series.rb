=begin

Write a program that will take a string of digits and return all the possible consecutive
 number series of a specified length in that string.


 Rules/Requirements: 
input: string
output: of #slices method => array (multidimensional)

- Given a integer argument to #slices, return an array of all possible consecutive
(overlapping) numbers as a multidimensional array where eas subarray's size is equal
to the integer passed in
- If the given integer to #slices is larger than the size of the string given to 
the Series object on instantiation, throw an error

Based on Test Cases provided:

- Need a Series class
  - upon instantiation, takes 1 argument, string
  - has a #slices method that takes 1 integer argument

Series Class:

constructor:
- takes one string as an argument, save as an instance variable, `number`

#series(1 integer argument)
- returns an array (of integers)
- operates on the `number` instance variable to return an array of consecutive, overlapping
digits from the string of numbers
- need to convert the string into an array of integers based on it's digits
- raise an ArgumentError if `number` length is less than the given integer

Test Cases / Examples
Look to provided test case file for this

Data Structure
Will convert given string upon instantiation into an array of it's individual 
integer digits


Brainstorming:
- If converting a string that starts with a 0 to an integer, the leading zero will not 
be included in the integer
  - this zero is needed for the #slice method, therefore best to convert given string
  into an array of its characters before transforming each one to an integer

Algorithm:

Series class:

constructor: (number_string)
- assign `string` to instance variable `number_string`

#slices (slice_size)
- Raise an ArgumentError if `number_string.length` is < slize_size
- convet slice_size to an array of it's integer digits using String#chars and `map` 
to convert each char to an integer, `digit_array`
- easy way is to call each cons on this array with slize_size as the argument, 
then return the multidimensional array returned from this operation
- More procedural way:
  - init sliced_array to an empty array
  - start loop:
    - append subarray of first `slice_size` count of elements from `digit_array`
    to `sliced_array`
    - delete the first element from `digit_array` (shift)
    - break loop if `digit_array` size is < `slice_size`
- return `sliced_array`
=end

class Series
  attr_reader :number_string

  def initialize(number_string)
    @number_string = number_string
  end

  def slices(slice_size)
    if slice_size > number_string.length
      raise(ArgumentError.new, "Slice size larger than number_string")
    end

    number_string.chars.map(&:to_i).each_cons(slice_size).to_a
    

    # Procedural implementation:

    # digits_array = number_string.chars.map(&:to_i)
    # sliced_array = []
    # loop do
    #   sliced_array << digits_array.take(slice_size)
    #   digits_array.shift
    #   break if digits_array.size < slice_size
    # end
    # sliced_array
  end
end
