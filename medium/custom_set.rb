=begin
Sometimes it is necessary to define a custom data structure of some type, like a set.
 In this exercise you will define your own set type. How it works internally doesn't
  matter, as long as it behaves like a set of unique elements that can be manipulated 
  in several well defined ways.

Rules/Requirements:

- all elements of Set must be numbers
- need a CustomSet class




CustomSet Class:
constructor: 1 argument ( array) (optional)
- if no argument given, should contain empty array?
  - might be an multidimensional array, `subsets`
#empty?
- returns boolean

#contains? (takes integer argument)
- returns boolean

#subset? ( takes a CustomSet as an argument)
- returns boolean
- checks to see whether 


#disjoint? (takes CustomSet as an argument)
- returns boolean

#eql? (takes CustomSet as argument)
- returns boolean
- seems to test if calling object and argument contain a subset of same elements?
  - order of elements doesn't matter
  - further testing shows that duplicate elements don't matter ie: [1, 2, 2, 1] == [2, 1] returns true

#add (takes integer argument)
- adds argument to array contained in CustomSet object

#intersection (takes {CustomSet argument) })
- returns CustomSet object
- seems that returned CustomSet object contains only those elements in it's array'
that are common to both calling CustomSet and CustomSet passed in as an argument

#difference (Takes CustomSet argument)
- returns CustomSet object
- returned CustomSet object's array should contain only thos eelements that 
are present in the calling CustomSet and not the one passed as an argument

#union (takes CustomSet as an argument)
- returns CustomSet object
- returned CustomSet object's array should contain all the elements that makeup both objects, 
with duplicates removed

=end

class CustomSet
  def initialize(collection = [])
    @collection = collection.uniq
  end

  def empty?
    # returns true if @subset is empty
    collection.empty?
  end

  def contains?(element)
    #return strue if CustomSet includes element
    collection.include?(element)
  end

  def subset?(custom_set)
    # should return true if all the elements from calling set are in custom_set
    collection.all? { |element| custom_set.collection.include?(element)}
  end

  def disjoint?(custom_set)
    # returns true if no elements from calling set are found in custom_set
    collection.none? { |element| custom_set.collection.include?(element) }
  end

  def eql?(custom_set)
    #returns true if calling set and custom_set have exact same elements, order doesn't matter
    collection.uniq.sort == custom_set.collection.uniq.sort
  end

  def add(element)
    collection << element unless contains?(element)
    self
  end

  def intersection(custom_set)
    #returns new CustomSet that contains all elements that are common to both A and B
    intersected_array = (collection & custom_set.collection).uniq
    CustomSet.new(intersected_array)
  end

  def union(custom_set)
    # returns a new CustomSet that contains all elements that are in A and B total, no duplicates
    union_array = (collection | custom_set.collection).uniq
    CustomSet.new(union_array)
  end

  def difference(custom_set)
    # returns new CustomSet that contains all elements from calling object that are not in custom_set
    difference_array = collection.difference(custom_set.collection).uniq
    CustomSet.new(difference_array)
  end
  
  def ==(other)
    collection.sort == other.collection.sort
  end

  protected
  attr_accessor :collection

end