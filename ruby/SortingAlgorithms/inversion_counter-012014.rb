require_relative 'merge_sort-01262014'

class InversionCounter < MergeSort
  attr_reader :inversions

  def initialize(array)
    super
    @inversions = 0
  end

  def recurse_on_both_halves
    l = InversionCounter.new(@left_half)
    r = InversionCounter.new(@right_half)

    @left  = l.sort
    @right = r.sort

    add_inversions(l.inversions)
    add_inversions(r.inversions)

    return self
  end
  
  def next_left_is_greater_than_next_right
    if @left[0].nil?
      false
    elsif @right[0].nil?
      true
    else
      if @left[0] >= @right[0]
        true
      else
        add_inversions(@left.length)
        false
      end
    end
  end

  def add_inversions(new_inversions)
    @inversions += new_inversions
  end
end

def read_file(file_name = "test_data/IntegerArray.csv")
  require "csv"

  m = Array.new

  #read in graph
  CSV.foreach(file_name, :converters => :integer) do |row| 
    m.concat(row)
  end
  m
end

def test1
  start = Time.now
  m = [5,4,3,2,1]
  i = InversionCounter.new(m)
  i.sort 
  puts "Completed in #{Time.now - start} seconds."
  puts "inversions = #{i.inversions}"
  puts "difference = #{i.inversions - 0}"
  i.inversions == 0
end

def test2
  start = Time.now
  m = [6,4,2,5,3,1]
  i = InversionCounter.new(m)
  i.sort 
  puts "Completed in #{Time.now - start} seconds."
  puts "inversions = #{i.inversions}"
  puts "difference = #{i.inversions - 3}"
  i.inversions == 3
end

def test3
  start = Time.now
  m = read_file(file_name = "test_data/IntegerArray.csv").reverse
  i = InversionCounter.new(m)
  i.sort 
  puts "Completed in #{Time.now - start} seconds."
  puts "inversions = #{i.inversions}"
  puts "difference = #{i.inversions - 2407905288}"
  i.inversions == 2407905288
end