# Reverse a C-style string
class String
  def rev
    rev = ""

    self.chars do |char|
      rev.insert(0, char)
    end

    rev
  end
end

def test
  # all tests should return true
  "abbc".rev == "abbc".reverse
  "12234".rev == "12234".reverse
  "blob".rev == "blob".reverse
  "som here$ ".rev == "som here$ ".reverse
  "quick and brown".rev == "quick and brown".reverse
end

test