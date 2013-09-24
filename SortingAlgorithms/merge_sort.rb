# takes an array and returns a new array with the same elements ordered from smallest to largest
def merge_sort(m)
  #base case
  if m.length <= 1
    m
  #all other cases
  else
    #intialize variables
    left = Array.new
    right = Array.new
    middle = m.length/2

    #split first half to left and second half to right, call merge sort recursively
    left = merge_sort(m[0..middle-1])
    right = merge_sort(m[middle..-1])

    #merge left and right
    merge = merge(left, right)
    
    #return merge
    merge
  end
end

def merge(left, right)
  #initializations
  output = Array.new(left.length+right.length)
  i = 0
  j = 0

  #go through each element in the ouput array and insert a value from left or right
  output.each_with_index do |k, index|
    #before the counters for either left and right have ended    
    if i < left.length && j < right.length  
      if left[i] < right[j]
        output[index]=left[i]
        i += 1
      else
        output[index]=right[j]
        j += 1
      end
    #when counter for left has reached end, but right has not
    elsif i >= left.length && j < right.length
      output[index]=right[j]
      j += 1
    #when counter for right has reached end, but left has not
    elsif i < left.length && j >= right.length
      output[index]=left[i]
      i += 1    
    end
  end
  
  #return ouput
  output
end

def test 
  a = []
  b = [-88,88,3,-22,1,2,3,0]
  c = [1,2,3,4,5]
  d = [5,4,3,2,1]
  e = "1,2,3,4"
  f = [1,"b",3,4]

  puts merge_sort(a) == []
  puts merge_sort(b) == [-88,-22,0,1,2,3,3,88]
  puts merge_sort(c) == [1,2,3,4,5]
  puts merge_sort(d) == [1,2,3,4,5]
end
