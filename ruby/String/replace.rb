# Write a method to replace all spaces in a string with ‘%20’
class String
  def replace(orig_char = " ",rep_char = "%20")
    result = ""

    self.each_char do |char|
      if char == orig_char
        result << rep_char
      else
        result << char
      end
    end

    result
  end
end

def test
  puts "abc def".replace == "abc%20def"
  puts "abcdef".replace == "abcdef" 
  puts "   ".replace == "%20%20%20" 
  puts "ab cd ef".replace(" ","X") == "abXcdXef" 
  puts "ab cd ef".replace("d","X") == "ab cX ef" 
end

test