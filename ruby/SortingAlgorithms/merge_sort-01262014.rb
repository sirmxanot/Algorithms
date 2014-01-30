# This is an OOP implementation of merge sort. It is not meant to be my most efficient implmentation. It is meant to help me practice object oriented design
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
    split_arrays = @original_array.each_slice(2).to_a
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
    until @left.sorted_array.empty? and @right.sorted_array.empty?
      @sorted_array.push next_biggest_element
    end

    return @sorted_array
  end

  def next_biggest_element
    if @left.sorted_array[0].is_greater_than @right.sorted_array[0]
      @left.sorted_array.pop
    else
      @right.sorted_array.pop
    end
  end

  def is_greater_than(element)
    if self.nil?
      false
    elsif element.nil?
      true
    else
      self > element
    end
  end

  def original_array_is_base_case
    @length < 2
  end
end

class Array
  def is_base_case
    self.length < 2
  end
end