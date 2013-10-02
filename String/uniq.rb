#Remove the duplicate characters in a string
class String
  def uniq
    chars = Hash.new

    self.each_char do |char|
      chars[char] = char unless chars.has_key?(char)
    end

    chars.keys.join
  end
end

def test
  # test non-destructive dedupe
  puts "aabbcc".uniq == "abc"
  puts "112233".uniq == "123"
  puts "abacabac".uniq == "abc"
  puts " $ a A 111 ".uniq == " $aA1"
  puts "".uniq == ""
  puts "abc".uniq == "abc"
end

test