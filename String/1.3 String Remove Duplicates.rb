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
  "aabbcc".dedupe == "abc"
  "112233".dedupe == "123"
  "abacabac".dedupe == "abc"
  " $ a A 111 ".dedupe == " $aA1"
  "".dedupe == ""
  "abc".dedupe == "abc"
end

test