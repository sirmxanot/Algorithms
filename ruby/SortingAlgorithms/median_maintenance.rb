def mm(file_name = "test_data/Median.txt")
  require "rubygems"
  require "algorithms"

  @low = Containers::MaxHeap.new
  @high = Containers::MinHeap.new

  sequence = Array.new
  medians = Array.new

  #read in raw graph
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |line|
      number = line.to_i
      sequence.push(number)
    end
  end 

  sequence.each do |element|
    new_median = median_maintenance(element)
    medians.push(new_median)
  end

  sum = medians.inject(:+)
  answer = sum % 10000
end

def median_maintenance(num)
  old_med = return_median
  old_med ||= 0

  add_element(num, old_med)

  balance_heaps

  new_med = return_median
end

def return_median
  if @high.size > @low.size
    @high.min
  else
    @low.max
  end
end

def add_element(num, old_med)
  if num > old_med 
    @high.push(num)
  else
    @low.push(num)
  end
end

def balance_heaps
  if @high.size > @low.size + 1
    @low.push(@high.min!)
  elsif @low.size > @high.size + 1
    @high.push(@low.max!)
  end
end 

def test
  mm == 1213
end