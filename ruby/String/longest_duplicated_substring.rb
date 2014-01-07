# Write a method that returns the longest duplicated substring of a string
class String

  #NAIVE IMPLEMENTATION
  def lds
    answer_length = self.length - 1
    answer = "DNE"

    until answer_length < 1
      strings = self.substrings_picker(answer_length)

      if strings.uniq == strings
        answer_length -= 1
      else
        scount = Hash.new
        strings.each do |string|
          if scount.has_key?(string)
            scount[string] += 1
          else
            scount[string] = 1
          end 
        end
        quantity = scount.values.sort.pop
        return scount.key(quantity)
      end
    end

    return answer
  end

  def substrings_picker(substring_length)
    result = []
    
    if substring_length > 0
      first = 0
      last = substring_length - 1

      until last == self.length
        result << self[first..last]
        first += 1
        last  += 1
      end
    end 
    
    return result
  end
end

def test
  #test lds
  puts "banana".lds == "ana"
  puts "Ask not what your country can do for you, ask what you can do for your country.".lds == " can do for you"
  puts "1234123678".lds == "123"
  puts "1@ ^^ @11@".lds == "1@"
  puts "   ".lds == "  "
  puts "aaaAaaa".lds == "aaa"
  puts "".lds == "DNE"
  puts " ".lds == "DNE"

  #test substrings_picker
  puts "banana".substrings_picker(5) == ["banan", "anana"]
  puts "banana".substrings_picker(4) == ["bana", "anan", "nana"]
  puts "banana".substrings_picker(3) == ["ban", "ana", "nan", "ana"]
  puts "banana".substrings_picker(2) == ["ba", "an", "na", "an", "na"]
  puts "banana".substrings_picker(1) == ["b", "a", "n", "a", "n", "a"]
  puts "banana".substrings_picker(0) == []
end

test