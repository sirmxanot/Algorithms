class MinHeap
  attr_accessor :heap

  def initialize(heap = Array.new)
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
    parent_index = ((i - 0.5) / 2).floor

    unless parent_value_of(i).nil? || @heap[i] >= parent_value_of(i) || parent_index < 0
      @heap.swap! i, parent_index
      bubble_up_key_at_index parent_index
    end
  end

  def parent_value_of i
    @heap[((i - 0.5) / 2).floor]
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
    children = [@heap[2*i+1]]
    children << @heap[2*i+2] if @heap[2*i+2]

    return children.min
  end

  def min_child_index_of i
    min_child_index = 2*i+1
    
    if @heap[2*i+2]
      min_child_index = 2*i+2 if @heap[2*i+2] < @heap[2*i+1]
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
  array_a = [4,4,8,9,4,12,9,11,13]
  array_b = [4,4,8,9,4,12,9,11,13]
  a = MinHeap.new(array_a)
  b = MinHeap.new(array_b)

  puts a.find_min    == array_a.min
  puts a.extract_min == array_a.min
  puts a.heap        == [4,4,8,9,13,12,9,11]

  puts b.insert(20)  == [4,4,8,9,4,12,9,11,13,20]
  puts b.insert(1)   == [1,4,8,9,4,12,9,11,13,20,4]
  puts b.insert(5)   == [1,4,5,9,4,8,9,11,13,20,4,12]
  puts b.extract_min == 1
  puts b.heap        == [4,4,5,9,4,8,9,11,13,20,12]
end