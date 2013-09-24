class String
  def anagram?(string2)
    self.chars.sort == string2.chars.sort
  end

  def anagram_from_scratch(string2)
    result = true

    self.each_char do |char|
      self.count(char) != string2.count(char) ? result = false : next
    end

    return result
  end
end

def test
  # test anagram?
  puts "abc".anagram?("cba") == true
  puts "aabbcc".anagram?("abc") == false
  puts "123".anagram?("213") == true
  puts "112233".anagram?("123") == false
  puts " $ a A 111 ".anagram?("$aA111     ") == true
  puts " $ a A 111 ".anagram?("$aA111    ") == false
  puts "".anagram?("") == true
  puts "abc".anagram?("abc") == true

  # test anagram_from_scratch
  puts "abc".anagram_from_scratch("cba") == true
  puts "aabbcc".anagram_from_scratch("abc") == false
  puts "123".anagram_from_scratch("213") == true
  puts "112233".anagram_from_scratch("123") == false
  puts " $ a A 111 ".anagram_from_scratch("$aA111     ") == true
  puts " $ a A 111 ".anagram_from_scratch("$aA111    ") == false
  puts "".anagram_from_scratch("") == true
  puts "abc".anagram_from_scratch("abc") == true
end

test