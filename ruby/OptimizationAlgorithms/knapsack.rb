# The recursive version is more elegant, but has ruby stack overflow problems with big input
def knapsack(knapsack_size = 10000, file_name = "test_data/knapsack1.csv")
  require "csv"

  stash = Array.new
  solutions = Hash.new
  weights = (0..knapsack_size).to_a

  CSV.foreach(file_name, :converters => :integer) do |row| 
    stash << [row[0], row[1]]
  end

  stash.each_index do |item_count|
    items = item_count + 1
    weights.each do |weight|
      solutions[[0,weight]] ||= 0
      if weight >= stash[item_count][1]
        if solutions[[items-1,weight]] >= solutions[[items-1,weight-stash[item_count][1]]] + stash[item_count][0]
          solutions[[items,weight]] = solutions[[items-1,weight]]
        else
          solutions[[items,weight]] = solutions[[items-1,weight-stash[item_count][1]]] + stash[item_count][0]
        end
      else
        solutions[[items,weight]] = solutions[[items-1,weight]]
      end
    end
  end

  return solutions[[stash.size,knapsack_size]]
end

def test
  start = Time.now
  result = knapsack()
  puts "Completed in #{Time.now - start} seconds."
  result == 2493893
end