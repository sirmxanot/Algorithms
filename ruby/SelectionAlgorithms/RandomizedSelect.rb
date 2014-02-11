# An implementation of a randomized pivot-based algorithm to select the 
# ith order statistic. Meant to practice OOP and functional decomposition
class RandomizedSelect
  def initialize(array)
    @original_array = array
    @left_partition = []
    @right_partition = []
    @partition = []
    @pivot_position = 0
    @ith_statistic = 0
  end

  def find_ith_statistic(i)
    @i = i 

    choose_pivot.partition_original_array.find_pivot_position

    if @pivot_position == @i
      @ith_statistic = @pivot
    else
      choose_partition.update_i.recurse_on_partition
    end
  end

  def choose_pivot
    @pivot = @original_array.sample

    return self
  end

  def partition_original_array
    @original_array.each do |n|
      @left_partition.push n if @pivot > n
      @right_partition.push n if @pivot < n
    end

    return self
  end

  def find_pivot_position
    @pivot_position = @left_partition.length + 1
  end

  def choose_partition
    if @pivot_position > @i
      @partition = @left_partition
    else
      @partition = @right_partition
    end

    return self
  end

  def update_i
    @i -= @pivot_position if @pivot_position < @i

    return self
  end

  def recurse_on_partition
    @ith_statistic = RandomizedSelect.new(@partition).find_ith_statistic(@i)
  end
end

def test
  a = (1..50).to_a.shuffle
  b = (-25..25).to_a.shuffle
  c = (-50..0).to_a.shuffle
  d = (-10..40).to_a.shuffle
  e = (1..100).to_a.shuffle
  i = (1..50).to_a.sample

  puts "i is #{i}"
  puts RandomizedSelect.new(a).find_ith_statistic(i) == a.sort[i-1]
  puts RandomizedSelect.new(b).find_ith_statistic(i) == b.sort[i-1]
  puts RandomizedSelect.new(c).find_ith_statistic(i) == c.sort[i-1]
  puts RandomizedSelect.new(d).find_ith_statistic(i) == d.sort[i-1]
  puts RandomizedSelect.new(e).find_ith_statistic(i) == e.sort[i-1]
end