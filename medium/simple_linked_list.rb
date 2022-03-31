# frozen_string_literal: true

# Write a simple linked list implementation. The linked list is a fundamental data
# structure in computer science, often used in the implementation of other data structures.
#
# The simplest kind of linked list is a singly linked list. Each element in the list
# contains data and a "next" field pointing to the next element in the list of elements.
# This variant of linked lists is often used to represent sequences or push-down stacks
#  (also called a LIFO stack; Last In, First Out).
#
# Let's create a singly linked list whose elements may contain a range of data such
# as the numbers 1-10. Provide functions to reverse the linked list and convert a
# linked list to and from an array.
#
#
# Rules/Requirements
# - need a Element class
# - need a SimpleLinkedList class
#
# - the data in the elements may contain a range of data such as numbers 1 - 10
# - provide function to reverse list
# - provide function to convert linnked list to an from an array
#
# - the tail of a LinkedList is the oldest item, or last item
# - the head is the most recently added item, and the one that is removed with pop
# - the tail Element does not point to another Element as next, becaause it's the last one
# -
#
# SimpleLinkedLIst Class
# - all items in list must be Element objects
# constructor:
# - @list = []
#
# - #push(data)
#   - takes 1 argument (data)
#   - should create a new Element object, with this `data` passed into the constructor
#     - if the @list is currently empty, that means this Element is the tail and therefore
#       should be created with only 1 argument, the `data`
#     - if @list is not empty, then the element needs to be created with second argument
#       that is the most recent item added to list , @list[-1]
#
#   - appends this element object to @list
#
# - #size
# - should return the number of elements in @list
#
# - #head
#     - returns the most recently added Element from @list
#
# - #peek
#   - returns the value of last item in the list (head)
# - #head
#   - returns most recently added element from LinkedList
#
# - #pop
#   - removes and returns the `head` element of `@list`
#
# - #to_a
#   - returns an array
#   - for whatever reason the returned array should be a reversed version of @list
#   - the array elements are the `datum` of each `Element` inthe LL, not the `Element` itself
#
# - SimpleLinkedList::from_a: takes an array as argument
#   - returns a new SimpleLinkedList object created from given array
#   - given array argument should be reversed, then pushed onto @list
#       - I have no idea why the array needs to be reversed, but this matches
#       the test cases
#   - For each element in the given array, a new `Element` object should be created with
#   the element as its `datum`
#
# - #reverse
#
# - #empty?
# - returns true if @list has no elements in it, false otherwise
#
#
#
# Element class -
#
# constructor:  (data, next_element = nil)
# - takes one or more  arguments (the data to add to itself)
# - the optional second argument would be anothe Element object that
# should be assigned to the 'next_element' instance variable of this element
#
# - @data = [data passed in]
#
# - Needs a variable to hold the current 'position'
# - it seems to wrap around, so maybe an array using the #rotate method
#
# -
# datum:
# - return the @data of the element
#
# tail?
# - returns boolean, is this element last element in the list?
# - should return true/false based on @next_element status
#       - return false if @next_element is `nil`
#
# next
# - should return the Element object assigned to @next_element
#   - returns `nil` if no element assigned to @next_element
#
#==(other)
# - should return compare the @data from one element to another for equality
#
#
#
#

class SimpleLinkedList
  def initialize
    @list = []
  end

  def push(data)
    if empty?
      list.push(Element.new(data))
    else
      list.push(Element.new(data, list.last))
    end
  end

  def size
    list.size
  end

  def head
    list.last
  end

  def peek
    head&.datum
  end

  def pop
    list.pop.datum
  end

  def empty?
    list.empty?
  end

  def to_a
    list.reverse.map(&:datum)
  end

  def self.from_a(array)
    list = SimpleLinkedList.new

    array&.reverse_each { |item| list.push(item) }
    list
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end

  private

  attr_accessor :list
end

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
 end

  def tail?
    self.next.nil?
  end
end
