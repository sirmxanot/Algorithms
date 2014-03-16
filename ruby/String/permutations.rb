class String
  def find_permutations_easy
    self.chars.to_a.permutation.map &:join
  end

  def find_permutations
    permutations = []

    if self.size == 1
      return [self]
    else
      self.chars.each do |char|
        remaining_chars = self.clone.delete char
        
        sub_permutations = remaining_chars.find_permutations

        sub_permutations.each do |sub_perm|
          permutations << char + sub_perm
        end
      end
    end

    return permutations
  end
end

def test
  permutations = ["dcba", "cdba", "cbda", "cbad", "dbca", 
    "bdca", "bcda", "bcad", "dbac", "bdac", "badc", "bacd", "dcab", "cdab", 
    "cadb", "cabd", "dacb", "adcb", "acdb", "acbd", "dabc", "adbc", "abdc", 
    "abcd"].sort 

  puts "abcd".find_permutations_easy.sort == permutations 
  puts "abcd".find_permutations.sort      == permutations
end