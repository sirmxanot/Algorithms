# Reverse a C-style string
class String
  def rev
    rev = ""

    self.each_char do |char|
      rev.insert(0, char)
    end

    rev
  end
end

def test
  # all tests should return true
  puts "abbc".rev == "abbc".reverse
  puts "12234".rev == "12234".reverse
  puts "blob".rev == "blob".reverse
  puts "som here$ ".rev == "som here$ ".reverse
  puts "quick and brown".rev == "quick and brown".reverse
end

test