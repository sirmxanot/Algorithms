#Remove the duplicate characters in a string
class String
  def dedupe
    chars = Hash.new

    self.each_char do |char|
      chars[char] = char unless chars.has_key?(char)
    end

    chars.keys.join
  end
end

def test
  # test non-destructive dedupe
  puts "aabbcc".dedupe == "abc"
  puts "112233".dedupe == "123"
  puts "abacabac".dedupe == "abc"
  puts " $ a A 111 ".dedupe == " $aA1"
  puts "".dedupe == ""
  puts "abc".dedupe == "abc"
end

test