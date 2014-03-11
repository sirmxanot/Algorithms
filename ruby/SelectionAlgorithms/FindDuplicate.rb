#Given an array of integers of length n, containing values between 1 and n-1, find the duplicate entry.

class Array
  #linear time and constant additional space
  def find_dupe_by_sums
    expected_sum = (self.length * (self.length - 1))/2
    actual_sum = 0

    self.map { |n| actual_sum += n }

    return actual_sum - expected_sum
  end

  #linear time and linear space
  def find_dupe_with_hash
    h = Hash.new
    dupe = 0

    #self.map { |n| h.has_key? n ? dupe = n : h[n] = n }

    self.each do |n|
      if h.has_key? n
        dupe = n
      else
        h[n] = n
      end
    end

    return dupe
  end

  #nlog(n) time and linear additional space
  def find_dupe_by_sorting
    self.sort!

    comparison = 0
    dupe = 0

    self.map { |n| n == comparison ? dupe = n : comparison = n }

    return dupe
  end
end

def test
  a1 = (1..999).to_a << 1
  a2 = (1..66).to_a << 66
  a3 = (1..9999).to_a << 4483

  puts a1.find_dupe_by_sums == 1
  puts a2.find_dupe_by_sums == 66
  puts a3.find_dupe_by_sums == 4483

  puts a1.find_dupe_by_sorting == 1
  puts a2.find_dupe_by_sorting == 66
  puts a3.find_dupe_by_sorting == 4483

  puts a1.find_dupe_with_hash == 1
  puts a2.find_dupe_with_hash == 66
  puts a3.find_dupe_with_hash == 4483
end