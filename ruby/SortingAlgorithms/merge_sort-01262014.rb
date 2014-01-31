# This is an OOP implementation of merge sort. 
# It is not meant to be my most efficient implmentation. 
# It is meant to help me practice ood and functional decomposition
# I found it more elegant to return a sorted array biggest -> smallest
class MergeSort
  attr_reader :sorted_array

  def initialize(array)
    @original_array = array
    @length = @original_array.length
    @sorted_array = []
  end

  def sort
    if original_array_is_base_case
      return @original_array
    else
      split_original_array.recurse_on_both_halves.merge_and_return_the_results
    end
  end

  def split_original_array
    length_of_largest_half = (@length/2.0).ceil
    split_arrays = @original_array.each_slice(length_of_largest_half).to_a
    
    @left_half = split_arrays[0]
    @right_half = split_arrays[1]

    return self
  end

  def recurse_on_both_halves
    @left  = MergeSort.new(@left_half).sort
    @right = MergeSort.new(@right_half).sort

    return self
  end

  def merge_and_return_the_results
    until @left.empty? and @right.empty?
      @sorted_array.push next_biggest_element
    end

    return @sorted_array
  end

  def next_biggest_element
    if next_left_is_greater_than_next_right
      @left.shift
    else
      @right.shift
    end
  end

  def next_left_is_greater_than_next_right
    if @left[0].nil?
      false
    elsif @right[0].nil?
      true
    else
      @left[0] > @right[0]
    end
  end

  def original_array_is_base_case
    @length < 2
  end
end