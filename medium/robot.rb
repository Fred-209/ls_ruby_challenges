=begin
Write a program that manages robot factory settings.

Rules/Requiremetns: 

- when a robot is reset, it's name gets wiped. 
  - when this happens, upon the next time it is asked for its name it should
  respond with a new random name
- When a robot is first created, it has no name. 
- Their name is created the first time they are boot up
- names should be random and not follow a predictable sequence to avoid name 
collisions
- Do not allow th euse of the same name twice

Based on Test Caes: 
- Need a Robot class
- Robot class has a #name method
  - robot name should not be set until this name is invoked for the first time
  - calling this method after a name has been set, should return the robot name and not 
  create a new one
- robot class name format should be any 2 capital letters, followed by any 3 digits
- Robot has a #reset method
  - this method shoud reset the robot name and a new one should be created next time 
  that #name in invoked
- Could use a class variable for names to make sure that names are not taken
  - Everytime a name is created, it should be added to this array assigned to a class 
  variable
  - @@taken_names = []

Data Structure:
- array to hold taken names
- string to hold names



Brainstorming:
- Could use constants for LETTERS and NUMBERS that are arrays of digits 0-9 and 
letters A-z to use as the sample pool for random  name characters
- @@taken_names << created names to this
- need to delete name from @@taken_names array if a robot's name is reset
  - delete it from pool after assigning new one
- helper method `generate_name` could be used to create the random name

Algorithm: 
Robot Class:

constructor: 
  - init @name instance variable to nil

- initialize class variable @@taken_names to an empty array
- LETTERS assigned to range of letters A-Z
- NUMBERS assigned to range of digits 0-9

#name
- generates a random name consisting of 2 uppercase letters followed by 
3 digits
- If @name exists, return @name

- assign @name to result of calling `generate_name`

#reset
- reassign @name to nil

#generate_name
- generates a random name from LETTERS and NUMBERS
- set name local variable to empty string
  loop:
  - 2 times:
    - get random letter from LETTERS
    - append it to `name`
  - 3 times:
    - get random digit from Digits
    - append it to `name`
  - break out of loop unless name is included in @@taken_names
  - clear name string
- append `name` to @@taken_names array
- return `name`
  


=end

class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = ('0'..'9').to_a

  @@taken_names = []

  def initialize
    @name = nil
  end

  def name
    @name = generate_name unless @name
    @name
  end

  def reset
    @@taken_names.delete(@name) if @name
    @name = nil
  end

  private
  

  def generate_name
    name = ''
    loop do 
      2.times { name << LETTERS.sample }
      3.times { name << DIGITS.sample }
      break unless @@taken_names.include?(name)
      name.clear
    end
    
    @@taken_names << name
    name
  end
end