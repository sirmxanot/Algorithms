def knapsack_recursive(knapsack_size = 10000, file_name = "test_data/knapsack1.csv")
  require "csv"

  @value = Hash.new
  @weight = Hash.new
  @solutions = Hash.new
  key ||= 1

  CSV.foreach(file_name, :converters => :integer) do |row| 
    @value[key] = row[0]
    @weight[key] = row[1]
    key += 1
  end

  solution(@value.size,knapsack_size)
end

def solution(items, weight)
  if items <= 0
    0
  elsif @solutions[[items,weight]] != nil
    @solutions[[items,weight]]
  else
    s1 = solution(items-1, weight)
    
    if weight > @weight[items]
      s2 = solution(items - 1, weight - @weight[items]) + @value[items]
    else 
      s2 = s1
    end

    @solutions[[items,weight]] = [s1,s2].max
  end
end

def test
  start = Time.now
  result = knapsack_recursive()
  puts "Completed in #{Time.now - start} seconds."
  result == 2493893
end