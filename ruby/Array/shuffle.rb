# shuffle an array in place
# shuffle is built into ruby. array.shuffle

class Array
  def my_shuffle
    index_start = 0
    index_end   = self.size - 1

    self.each do |position|
      self.swap! index_start, rand(index_start..index_end)
      index_start += 1
    end
  end

  def swap! i_1, i_2
    self[i_1], self[i_2] = self[i_2], self[i_1]

    return self
  end
end

def test
  a = [1,2,3,4,5]
  b = ["a","n","d","r","e","w"]

  puts a.my_shuffle
  puts b.my_shuffle
end