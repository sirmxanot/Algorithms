def merge_sort_inversion_counter(m)

  #base case
  if m.length <= 1 
    return m, 0
  #all other cases
  else
    #intialize variables
    left = Array.new
    right = Array.new
    middle = m.length/2

    #split first half to left and second half to right, call merge sort recursively
    left, counter_l = merge_sort_inversion_counter(m[0..middle-1])
    right, counter_r = merge_sort_inversion_counter(m[middle..-1])

    #merge left and right
    merge, counter_m = merge(left, right)
    
    counter = counter_l + counter_r + counter_m
    
    #return merge
    return merge, counter
  end
end

def merge(left, right)
  #initializations
  output = Array.new
  i = 0
  j = 0
  counter = 0

  #for loop controling position k within the output array
  for k in (0..(left.length+right.length-1))
    #before the counters for either left and right have ended
      if i < left.length && j < right.length  
        if left[i] <= right[j]
          output[k] = left[i] 
          i += 1
        else
          output[k] = right[j]
          counter = counter + (left.length - i)
          j += 1
        end
      #when counter for left has reached end, but right has not
      elsif i >= left.length && j < right.length
          output[k] = right[j]
          j += 1
      #when counter for right has reached end, but left has not
      elsif i < left.length && j >= right.length
          output[k] = left[i] 
          i += 1    
      end
    end

  #return ouput
  return output, counter
end

def read_file(file_name = "IntegerArray.csv")
  require "csv"

  m = Array.new

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    m.concat(row)
  end
  m
end

def time
  start = Time.now
  m = read_file(file_name = "IntegerArray.csv")
  result = merge_sort_inversion_counter(m)
  puts "Completed in #{Time.now - start} seconds."
  result
end