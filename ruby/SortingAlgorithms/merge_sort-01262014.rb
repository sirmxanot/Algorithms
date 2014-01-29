# This is an OOP implementation of merge sort. It is not meant to be my most efficient implmentation. It is meant to help me practice object oriented design
class MergeSort
  def inititialize(array)
    original_array = array
    length = original_array.length
    sorted_array = sort_original_array

    return sorted_array
  end

  def sort_original_array
    if original_array.is_base_case?
      return original_array
    else
      split_original_array.recurse_on_both_halves.merge_and_return_the_results
    end
  end

  def split_original_array
    split_arrays = original_array.each_slice(2).to_a
    left_half = split_arrays[0]
    right_half = split_arrays[1]

    return self
  end

  def recurse_on_both_halves
    left  = MergeSort.new(left_half)
    right = MergeSort.new(right_half)

    return self
  end

  def merge_and_return_the_results
    
    return sorted_array
  end

  def is_base_case?
    length < 2
  end
end