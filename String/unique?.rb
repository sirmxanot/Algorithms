#Implement an algorithm to determine if a string has all unique 
#characters. What if you can not use additional data structures?

def unique?(string)
  array = string.chars.to_a
  array == array.uniq
end

def unique_from_scratch(string)
  chars = Hash.new
  
  string.each_char do |char|
    chars[char] = char unless chars.has_key?(char)
  end

  chars.length == string.length
end

def test
  #all tests should return true
  puts unique?("AaBbCc") == true
  puts unique?("aa") == false
  puts unique?("12345") == true
  puts unique?("1223") == false
  puts unique?("The quick brown f") == false
  puts unique?("Thequickbrownf") == true

  puts unique_from_scratch("AaBbCc") == true
  puts unique_from_scratch("aa") == false
  puts unique_from_scratch("12345") == true
  puts unique_from_scratch("1223") == false
  puts unique_from_scratch("The quick brown f") == false
  puts unique_from_scratch("Thequickbrownf") == true
end

test