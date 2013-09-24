def two_sum(interval_low = 2500, interval_high = 2750, file = "test_data/HashInt.txt")
  @universe = Hash.new
  @solutions = 0

  #read in raw graph
  File.open(file, "r") do |file_handle|
    file_handle.each_line do |line|
      number = line.to_i
      @universe[number] = number unless @universe.has_key?(number)
    end
  end 

  (interval_low..interval_high).each do |goal|
    @solutions += 1 if satisfied?(goal)
  end

  @solutions
end

def satisfied?(goal)
  true if @universe.keys.detect { |x| solution_exists?(goal, x) }
end

def solution_exists?(goal, x)
  @universe.has_key?(goal - x) if x != goal - x
end

def test 
  two_sum == 239
end