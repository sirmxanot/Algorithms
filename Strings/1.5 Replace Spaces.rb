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

    return result
  end
end

def test
  "abc def".replace == "abc%20def"
  "abcdef".replace == "abcdef" 
  "   ".replace == "%20%20%20" 
  "ab cd ef".replace(" ","X") == "abXcdXef" 
  "ab cd ef".replace("d","X") == "ab cX ef" 
end

test