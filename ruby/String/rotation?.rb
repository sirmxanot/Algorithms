# Using the string method include? check if one word is a rotation of the other using only one call to include?
class String
  def rotation?(word2)
    if self.length != word2.length
      false
    else 
      (self + self).include?(word2)
    end
  end
end

def test
  puts "abcde".rotation?("eabcd") == true
  puts "abcdef".rotation?("eabcd") == false 
  puts "abcdef".rotation?("eabcdf") == false 
  puts "".rotation?("") == true 
  puts "ab 12 &%".rotation?("12 &%ab ") == true 
  puts "ab 12 &%".rotation?("12 &% ab ") == false
end

test