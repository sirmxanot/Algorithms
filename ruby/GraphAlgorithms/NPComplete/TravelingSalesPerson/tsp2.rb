def tsp(file_name = "test_data/test.csv")
  require "csv"
  require "bitwise"

  inf = Float::INFINITY
  @raw = Hash.new # key = city id number, value = coordinates [x, y]
  @graph = Hash.new # key = [c1ID, c2ID], value = euclidian distance
  @a = Hash.new #key = [subg in binary string, size], value = shortest 
                #path dist
  short_paths = Hash.new

  i ||= 0

  #read in raw graph
  CSV.foreach(file_name, :converters => :float) do |row| 
    @raw[i] = [row[0] , row[1]]
    i += 1
  end

  #calculate all distances in raw graph to make graph
  @raw.each_pair do |n1, p1|
    @raw.each_pair do |n2, p2|
      @graph[[n1, n2]] = euc_dist(p1,p2)
    end
  end 

  #find min paths for each choice of j in complete graph
  @raw.keys.each do |j|
    #all_nodes = "1111111111111111111111111"
    all_nodes = "111111111111"
    puts "node #{j}"
    short_paths[j] = answer(all_nodes, j) unless j == 0
  end

  #find the path + arc back to 0 that is shortest
  answer = Array.new
  short_paths.each_pair do |j, ans|
    answer << ans + @graph[[0,j]]
  end

  answer.min
end

def answer(s,j)
  require "bitwise"

  inf = Float::INFINITY
  subg = Bitwise.new
  subg.bits = s

  if j == 0
    if (s =~ /^10+0$/) == 0
      0
    else
      inf
    end
  elsif @a[[s,j]] != nil
    @a[[s,j]]
  else
    pot_ans = Array.new
    
    s_prime = subg.clone
    s_prime.unset_at(j)

    s_prime.indexes.each do |k|
      pot_ans << answer(s_prime.bits,k) + @graph[[j,k]]
    end

    @a[[s,j]] = pot_ans.min
  end
end

def euc_dist(p1,p2)
  xs = (p1[0] - p2[0])*(p1[0] - p2[0])
  ys = (p1[1] - p2[1])*(p1[1] - p2[1])
  dist = Math.sqrt(xs + ys)
end

def time
  start = Time.now
  result = tsp()
  puts "Completed in #{Time.now - start} seconds."
  result
end