#given an array of i distinct objects and a number of buckets j, returns an array of arrays where there
# are j elements in the highest level array and each sub-array holds (i/j) +- 1 objects and every object is
# in exactly one sub-array. it is deterministic (returns the exact same results for the same inputs every time)

class Array
  def distribute_across bucket_number
    #clone original array so that it can be reused
    #de dupe it and sort it so the output is clearer
    original_array = self.clone.uniq.sort
    parent = Array.new

    #did this instead of Array.new(bucket_number, Array.new) so that all the
    # child arrays dont point to the same object
    bucket_number.times do |child|
      parent << Array.new
    end
    
    #keep cycling through the child arrays adding one element from original array at a time until there are no more elements in origianl_array
    until original_array.empty?
      #go through each child array and add the first value in the original array to it
      parent.each do |child|
        #remove first element of original array and assign it to new_element
        new_element = original_array.shift

        #put this element at the end of the child array and avoid putting in nil values
        child << new_element unless new_element.nil?
      end
    end

    #sort child arrays within the parent array for clarity
    return parent.sort
  end
end

#test related methods
def size_of_parent_array size, output
  output.length == size
end

def all_elements_distributed input, output
  input.uniq.sort == output.flatten.sort
end

def no_duplicates output
  output.flatten.length == output.flatten.uniq.length
end

def bucket_sizes_even output
  sizes = output.map { |a| a.length }

  sizes.max - sizes.min <= 1
end

def test
  test_data = [[42],[1,4],[1,2,3,4,5],[4,6,2],[1,5,2,5,6,4,2,6],(1..11).to_a]
  
  test_data.each do |datum|
    (1..datum.uniq.length+1).each do |number_of_buckets|
      puts datum.distribute_across(number_of_buckets).to_s
      puts size_of_parent_array number_of_buckets, datum.distribute_across(number_of_buckets)
      puts all_elements_distributed datum, datum.distribute_across(number_of_buckets)
      puts no_duplicates datum.distribute_across(number_of_buckets)
      puts bucket_sizes_even datum.distribute_across(number_of_buckets)
    end
  end
end

test