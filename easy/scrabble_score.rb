=begin

Write a program that, given a word, computes the Scrabble score for that word.

You'll need the following tile scores:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

Sum the values of all the tiles used in each word. For instance, lets consider the 
word CABBAGE which has the following letters and point values:

    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14


input: a word
output: integer (score of the word)

Rules/Requirements:
- each letter in the word is worth a specific number of points, as listed above
- sum of the total of all these letter points to equal the word score, and this is 
what should be returned. 

Based on provided test cases:
- need a Scrabble class
  - this class has takes one argument (string)
  - has a #score method that computers the score of given word
 - if given string is empty or only whitespace,score should be 0
- if given string is nil, score should be 0
- scores should be case insensitive


Test Cases:
Scrabble.new('OXYPHENBUTAZONE').score
- look at provided test cases for more

Data Structure:
- array of word's characters to find the score of
- hash to hold the letter values for each letter in the alphabet

Brainstorming:
- Create a has that contains all letters of the alphabet as keys, and the 
letter value listed above for their values
- The #score method should convert the given word into an array of chars, transform each
char into the value found in LETTER_SCORES for each letter/key, then sum these values together and return

Scrabble class

LETTER_SCORES constant
- A hash with all letters of the alphabet as keys and values matched as listed above
SCORES = {
   %w[a e i o u l n r s t] => 1,
   %w[d g]                 => 2,
   %w[b c m p]             => 3,
   %w[f h v w y]           => 4,
   %w[k]                   => 5,
   %w[j x]                 => 8,
   %w[q z]                 => 10
}


constructor:
- takes one argument, a string
- save string as `word` instance variable

#score
- operates on `word` instance variable
- if `word` is nil, empty, or contains only spaces, return 0
- Iterate over SCORES: key, value
  - downcase `word` and iterate over its characters
    - if current `key` includes? `char`:
      - increment `sum` by `vlaue`
- return `sum`
=end

class Scrabble
  LETTER_SCORES = {
    %w[a e i o u l n r s t] => 1,
    %w[d g]                 => 2,
    %w[b c m p]             => 3,
    %w[f h v w y]           => 4,
    %w[k]                   => 5,
    %w[j x]                 => 8,
    %w[q z]                 => 10
 }    

  attr_reader :word

  def initialize(word)
    @word = word ? word : ''
  end

  def self.score(word)
    self.new(word).score
  end

  def score

    sum = 0
    LETTER_SCORES.each_pair do |key, value|
      word.downcase.each_char { |char| sum += value if key.include?(char)}
    end

    sum
  end
end

