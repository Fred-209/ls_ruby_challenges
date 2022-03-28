# frozen_string_literal: true

# Write a program that takes a word and a list of possible anagrams and selects the correct
# sublist that contains the anagrams of the word.
#
# input: single word
#   - #match takes an array of words
# output: an array of words from the given list that are anagrams of the given word
#
# Rules/Requirement:
# - an anagram of a word means the words letters can be rearranged to create this word
#   - this means anagrams must be the same length and have the exact same characters as
#   the word they are an anagram of
#
# - Based on Test Cases:
#   - need a Anagram class
#   - no anagrams found should return an empty array
#   - will need a #match method that is called Anagram objects
#     - this method returns an array containing anagram matches from the given list
#   - an identical word is NOT an anagram
#   - #match should be case insensitive
#   - cannot mix letters among words in list to form an anagram: each word should not
#   be split into chars
#   -
#
#   Examples:
#   Anagram.new('ant').match(%w(tan stand at) == ['tan']
#
#   Data Structure:
#   - have an array to contain the found anagrams
#
# Brainstorming:
# - need to delete any words given `word_list` if it is equal to given `word`
#   - this is because a word isn't an anagram of a word if they are the same word
# - assign `sorted_word` to result of splitting `word` into chars, sort, join
#   - create helper method sort_letters to do this
# - Iterate over each word in given `word_list`
#     - call `sort_letters` on current element, then compare it to `sorted_word`
#     - if they are equal, add this to builder array or use `select` here to select
#       only those words that are equal to `sorted_word`
# - return array of sorted words
#
# Algorithm
#
# constructor:
# - assign passed in word to base_word instance variable
#
#
# sort_letters(word)
# - private method
# - Split `word` into array of chars
# - Sort this word (ascending order)
# - join sorted letter array into string and return
#
# match - takes array of words
# - checks each word in `word_list` to see if it is an anagram of `base_word`
# - first delete any elements from `word_list` that are equal to the value of `base_word`
# - init `sorted_word` to result of calling `sort_lettes` on `base_word`
#   - need to downcase word before passing to `sort_letters`
# - Use `select` to iterate over `word_list`
#   - call `sort_letters` on current `word`
#     - also downcase before passing to `sort_letters`
#   - if `sorted_word` is equal to result of calling sort_letters on `word` in above line,
#     then this should be added to return array of select, therefore use comparison
#     to check for equality
# - return this selected array from above

class Anagram
  def initialize(word)
    @base_word = word
  end

  def match(word_list)
    word_list = word_list.reject { |word| word.downcase == base_word.downcase }
    sorted_word = sort_letters(base_word.downcase)

    word_list.select { |word| sort_letters(word.downcase) == sorted_word }
  end

  private

  attr_reader :base_word

  def sort_letters(word)
    word.chars.sort.join
  end
end
