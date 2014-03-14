class String
  def find_permutations_easy
    self.chars.permutation.map &:join
  end

  #heap's algorithm
  def find_permutations
    permutations = []

    if self.size == 1
      return permutations
    else
      self.chars.each do |char|
        puts "char #{char}"
        remaining_chars = self.delete char
        puts "remaining_chars #{remaining_chars}"
        
        sub_permutations = remaining_chars.find_permutations

        puts "sub_permutations #{sub_permutations}"

        permutations << sub_permutations
       
        # .each do |sub_perm|
        #   puts "sub_perm #{sub_perm}"
        #   permutations << char + sub_perm
        #   puts "permutations #{permutations}"
        # end
      end
    end
  end
end

def test
  permutations = ["dcba", "cdba", "cbda", "cbad", "dbca", 
    "bdca", "bcda", "bcad", "dbac", "bdac", "badc", "bacd", "dcab", "cdab", 
    "cadb", "cabd", "dacb", "adcb", "acdb", "acbd", "dabc", "adbc", "abdc", 
    "abcd"].sort 

  #puts "abcd".find_permutations_easy.sort == permutations 
  puts "abcd".find_permutations.sort      #== permutations 
end