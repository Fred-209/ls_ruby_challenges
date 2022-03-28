=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and 
the sum of the lengths of any two sides must be greater than the length of the third side.


Requirements/Rules:
- program should return whether given triangle is equilateral, isosceles, or scalene
- Need a Triangle class based on tests provided

Triangle Class
- instantiation takes 3 arguments
  - each arg is a number that represents the triangle side length
- has a '#kind' method that should return a string that is either
'equilateral', 'isosceles', or 'scalene'
 - should raise an ArgumentError if any side is  0 or less
- floats can be given as the side lengths
- should raise an ArgumentError if a negative side is given as argument
- should raise ArgumentError if the sum of the lengths of any 2 sides isn't greater than
the length of the third size

kind method:
- uses side1, side2, side3 as input
output: one of the three triangle types as a string

if all 3 sides are the same length, return 'equilateral'
  - if the sum of all 3 / 3 is equal to any side, then it's equilateral

=end

class Triangle
  attr_reader :side1, :side2, :side3, :sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @sides = [@side1, @side2, @side3]
    
    raise(ArgumentError.new) if illegal_size_given?
  end

  def kind
    return 'equilateral' if sides.all?(side1)
    return 'isosceles' if side1 == side2 || side2 == side3 || side1 == side3
    'scalene'
  end

  private


  def illegal_size_given?
    side1 + side2 <= side3 || side2 + side3 <= side1 || side1 + side3 <= side3 ||
    sides.any?(&:zero?)
  end
end