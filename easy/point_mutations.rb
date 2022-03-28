=begin
https://launchschool.com/exercises/fd2aaf29

Write a program that can calculate the Hamming distance between two DNA strands.

In short, the hamming distance is the number of diffrences between 2 DNA strands
- For this exercise, each DNA strand is a string of uppercase letters
- The two DNA strands (strings) need to be compared on a char by char basis
- If the char at an index value is different than the char at the same index from the other
dna strand(string), then that counts as a difference
- The total sum of these differences is the hamming distance
- if the two strings are of unequal length, then computer the hamming distance over the
  shorter length

input: two strings (dna strands)
output: integer (the hamming distance)

Rules/requirements:

Based on provided test cases:
- Need a DNA class
- must not mutate any given strings


DNA Class
- takes one argument on creation
  - this argument is one DNA strand (string)
- needs a #hamming_distance method



#hamming_distance
- input: string
-output: integer

- counter variable 'differences' init to 0
- init `smallest_dna_length` to result of calling `min` on an array 
containing strand1 length and strand2.length

- called on a DNATest object and takes one argument
  - the argument is a string represnting a DNA strand
- Need to compare input string with DNA @strand1, character by character
- If a char at current index in strand1 is different the the char at same index
position in strand2, increment `differences` by `
- Can iterate over a range from 0 through the length of the string with the smallest length
  - this makes sure iteration doesn't needlessly traverse chars from a longer string
  - (0...smallest_dna_length)

Data Structure:
- for the DNA#hamming_distance method, will increment an integer 
variable every time a difference is found between chars of the two dna strands (strings)



=end

class DNA
  attr_reader :strand1

  def initialize(strand)
    @strand1 = strand
  end

  def hamming_distance(strand2)
    differences = 0
    smallest_dna_length = [strand1.length, strand2.length].min

    (0...smallest_dna_length).each do |index|
      differences += 1 unless strand1[index] == strand2[index]
    end

    differences
  end
end