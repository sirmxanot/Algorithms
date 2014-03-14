class MinHeap
  attr_accessor :heap

  def initialize heap
    @heap = heap
  end
  
  def insert k
    @heap << k
    
    index_of_k = (@heap.size - 1)

    bubble_up_key_at_index index_of_k

    return @heap
  end

  def find_min
    @heap.first
  end

  def extract_min
    min = @heap.shift
    
    insert_last_leaf_as_root
    
    bubble_down_key_at_index 0

    return min
  end
  
  # def heapify

  # end

  # def merge

  # end

  private

  def bubble_up_key_at_index i
    parent_index = (i / 2).floor

    unless parent_value_of(i).nil? || @heap[i] >= parent_value_of(i)
      @heap.swap! i, parent_index
      bubble_up_key_at_index parent_index
    end
  end

  def parent_value_of i
    @heap[(i / 2).floor]
  end

  def insert_last_leaf_as_root
    @heap.unshift @heap.pop
  end

  def bubble_down_key_at_index i
    min_child         = min_child_of i
    min_child_index   = min_child_index_of i

    unless min_child.nil? || min_child >= @heap[i]
      @heap.swap! i, min_child_index
      bubble_down_key_at_index min_child_index
    end
  end

  def min_child_of i
    children = [@heap[2*i]]
    children << @heap[2*i+1] if @heap[2*i+1]

    return children.min
  end

  def min_child_index_of i
    min_child_index = 2*i
    
    if @heap[2*i+1]
      min_child_index = 2*i+1 if @heap[2*i+1] < @heap[2]
    end

    return min_child_index
  end
end

class Array
  def swap! i_1, i_2
    self[i_1], self[i_2] = self[i_2], self[i_1]

    return self
  end
end

def test
  array = [4,4,8,9,4,12,9,11,13]
  heap = MinHeap.new(array)

  puts heap.find_min    == array.min
  puts heap.extract_min == array.min
  puts heap.insert(20)#   == [4,4,8,9,4,12,9,11,13,20]
  #puts heap.insert(1)    == [1,4,8,9,4,12,9,11,13,20,4]
end