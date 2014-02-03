# An implementation of QuickSort to practice OOP and functional decomposition
class QuickSort
  def initialize(array)
    @original_array = array
    @length = @original_array.length
    @left_partition = []
    @right_partition = []
    @sorted_array = []
  end

  def sort
    if original_array_is_base_case
      return @original_array
    else
      choose_pivot.partition_original_array.recurse_on_partitions.combine
    end
  end

  def original_array_is_base_case
    @length < 2 or @original_array.uniq.length < 2
  end

  def choose_pivot
    @pivot = @original_array.sample

    return self
  end

  def partition_original_array
    @original_array.each do |n|
      @left_partition.push n if @pivot >= n
      @right_partition.push n if @pivot < n
    end
    
    return self
  end

  def recurse_on_partitions
    @left = QuickSort.new(@left_partition).sort
    @right = QuickSort.new(@right_partition).sort

    return self
  end

  def combine
    @sorted_array = @left + @right
  end
end

def read_file(file_name = "test_data/IntegerArray.csv")
  require "csv"

  a = Array.new

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    a.concat(row)
  end
  a
end

def test
  a = read_file
  b = [-88,88,3,-22,1,2,3,0]
  c = [1,2,3,4,5]
  d = [5,5,4,4,3,3,2,2,1,1]
  e = [-1,9,2,8,3,7]

  puts QuickSort.new(a).sort == a.sort
  puts QuickSort.new(b).sort == b.sort
  puts QuickSort.new(c).sort == c.sort
  puts QuickSort.new(d).sort == d.sort
  puts QuickSort.new(e).sort == e.sort
end