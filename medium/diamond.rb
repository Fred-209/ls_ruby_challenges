
# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given
# a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.
#
#
#     The first row contains one 'A'.
#     The last row contains one 'A'.
#     All rows, except the first and last, have exactly two identical letters.
#     The diamond is horizontally symmetric.
#     The diamond is vertically symmetric.
#     The diamond has a square shape (width equals height).
#     The letters form a diamond shape.
#     The top half has the letters in ascending order.
#     The bottom half has the letters in descending order.
#     The four corners (containing the spaces) are triangles.
#
# Rules/Requirements:
#
# input: string
# output: output to terminal a graphical representation based on specs above
#
# - First and last row of output must contain one 'A'\
# - see above for rest
#
#
#
# Brainstorming/Observations:
# - Each letter is on row X where X is it's count in the alphabet
# - Need to output in two halves, an ascending letter half on top, descending letter half on
# bottom
# - the number of spaces between the two border letters increases by 2 (except for jump from A to B
# on ascending, and B to A on descending, it only increases one space for these 0 to 1, or 1 to 0)
# - might be easier to have two functions:
#   - one to output top half of diamond
#   - one to output bottom half of diamond
# - If given letter is A, just output A
# - the given letter is the one on the middle row
# - DOn't need to repeat this middle row, keep that in mind if splitting
# the functions into top_half and bottom_half
# - Crearte an array of alphabet that can be referenced by index
# - Top half always starts with A and outputs up through the given letter
#   - Output in format of 'current letter + spaces + current letter'
#   - `spaces` should be incremented by two for each row print, except as noted above for first and last
#     - first and last should be incremented by 1 space
# - botom half:
#   - find index value of letter before given letter
#   - get subarray of alphabet from index 0 through index found above
#     - reverse this array, and this is the array to iterate over to create bottom half
#   - 0 1 3 5 7 5 3 1 0

class Diamond
  def self.make_diamond(diamond_letter)
    return "A\n" if diamond_letter == 'A'

    letter_spacing_map = create_letter_spacing_map(diamond_letter)

    diamond = ''
    diamond << 'A'.center(letter_spacing_map[diamond_letter] + 2) + "\n"

    diamond += create_top_diamond(diamond_letter, letter_spacing_map) +
               create_bottom_diamond(diamond_letter, letter_spacing_map)

    diamond << 'A'.center(letter_spacing_map[diamond_letter] + 2) + "\n"
  end

  class << self

    private
    
    def create_letter_spacing_map(last_letter)
      space_counter = 1

      ('B'..last_letter).each_with_object({}) do |letter, letter_spacing_map|
        letter_spacing_map[letter] = space_counter
        space_counter += 2
      end
    end

    def create_top_diamond(diamond_letter, letter_spacing_map)
      largest_space = letter_spacing_map[diamond_letter]

      ('B'..diamond_letter).each_with_object('') do |letter, diamond|
        spaces = letter_spacing_map[letter]
        diamond << "#{letter}#{' ' * spaces}#{letter}".center(largest_space + 2) + "\n"
      end
    end

    def create_bottom_diamond(diamond_letter, letter_spacing_map)
      largest_space = letter_spacing_map[diamond_letter] - 2

      ('B'...diamond_letter).reverse_each.with_object('') do |letter, diamond|
        spaces = letter_spacing_map[letter]
        diamond << "#{letter}#{' ' * spaces}#{letter}".center(largest_space + 4) + "\n"
      end
    end
  end
end
