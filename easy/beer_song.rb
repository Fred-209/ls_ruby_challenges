=begin
Write a program that can generate the lyrics of the 99 Bottles of Beer song. 
See the test suite for the entire song.

- Need a BeerSong class
   - this class has a class method `verse` that takes 1 integer as argument
   - has class method `verses` that takes multiple integers as arguments
  - it has a class method  `lyrics` that will print out all the lyrics to the beer song

BeerSong::verse
- if verse is 0, return verse_zero 
elsif verse is 1, return verse_one
elsif verse is 2, return verse_2
else:
  return "verse bottles of beer on the wall, verse bottles of beer.\n" \
  "Take one down and pass it around, verse - 1 bottles of beer on the wall.\n"

BeerSong::verses
  - takes 2 or more integers (*first_verses, last_verse)
  - create empty builder string `total_verses`
  - should iterate over first_verses and add each one to `total_verses` plus an extra 
  newline char "\n"
  - add last_verse to builder string and return
  - Each one of these are passed to `#verse`

BeerSong::lyrics
- returns a long string that contains every verse from 99 downto 0
- pass an array of 0 through 98 , reversed, to `verses` as first argument, and `0` as second argument
- this should build and return the entire lyric set


Brainstorming:
- The entire song has 99 verses
- Each verse, it starts with a number that is equal to the verse number
  - the exception to this is verse 0 and it has special lyrics, see test case for lyrics
- in the lyrics, if the bottle of beer is greater than one, then 'bottles' is used in lyrics, 
but 'bottle' is used if one or less
- The exception verses are 0, 1, and 2
  - verse 0 has a completely different lyric set
  - verse 1, uses singular 'bottle', and 'no more bottles of beer' on the wall
  - verse 2 uses plural for 'bottles' until it's taken down, then it refers to 
  '1' bottle of beer on the wall
- all verses,  except last verse (0) and verse 1, follows format of 
"verse_number bottles of beer on the wall, verse_number bottles of beer." \
"Take one down and pass it around, (verse_number -1) bottles of beer on the wall."
- could make special verse cases for 0, 1, 2 verses but all others can be dynamically generated 
based on verse number
- If multiple verses are printed, a newline separates them 

=end

class BeerSong
  
  
  def self.verse(verse_num)
    verse_zero = 
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    verse_one = 
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    verse_two = 
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    all_other_verses = 
      "#{verse_num} bottles of beer on the wall, #{verse_num} bottles of beer.\n" \
      "Take one down and pass it around, #{verse_num - 1} bottles of beer on the wall.\n"
    
    case verse_num
    when 0 then verse_zero
    when 1 then verse_one
    when 2 then verse_two
    else
      all_other_verses
    end
  end

  def self.verses(start_verse_num, end_verse_num)
    all_verses = ''
    verse_before_end_verse = end_verse_num + 1

    (verse_before_end_verse..start_verse_num).to_a.reverse_each do |verse_num|
      all_verses << verse(verse_num) << "\n"
    end
    all_verses << verse(end_verse_num)
  end

  def self.lyrics
    verses(99, 0)
  end
end

puts BeerSong.verses(2, 0)
