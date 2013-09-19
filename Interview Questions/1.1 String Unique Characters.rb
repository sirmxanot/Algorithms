#Implement an algorithm to determine if a string has all unique 
#characters. What if you can not use additional data structures?

def unique?(string)
  array = string.chars.to_a
  array == array.uniq
end

def unique_from_scratch(string)
  chars = Hash.new
  
  string.chars do |char|
    chars[char] = char unless chars.has_key?(char)
  end

  chars.length == string.length
end

def test
  #all tests should return true
  unique?("AaBbCc") == true
  unique?("aa") == false
  unique?("12345") == true
  unique?("1223") == false
  unique?("The quick brown f") == false
  unique?("Thequickbrownf") == true

  unique_from_scratch("AaBbCc") == true
  unique_from_scratch("aa") == false
  unique_from_scratch("12345") == true
  unique_from_scratch("1223") == false
  unique_from_scratch("The quick brown f") == false
  unique_from_scratch("Thequickbrownf") == true
end
