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
  "abc".anagram?("cba") == true
  "aabbcc".anagram?("abc") == false
  "123".anagram?("213") == true
  "112233".anagram?("123") == false
  " $ a A 111 ".anagram?("$aA111     ") == true
  " $ a A 111 ".anagram?("$aA111    ") == false
  "".anagram?("") == true
  "abc".anagram?("abc") == true

  # test anagram_from_scratch
  "abc".anagram_from_scratch("cba") == true
  "aabbcc".anagram_from_scratch("abc") == false
  "123".anagram_from_scratch("213") == true
  "112233".anagram_from_scratch("123") == false
  " $ a A 111 ".anagram_from_scratch("$aA111     ") == true
  " $ a A 111 ".anagram_from_scratch("$aA111    ") == false
  "".anagram_from_scratch("") == true
  "abc".anagram_from_scratch("abc") == true
end

test