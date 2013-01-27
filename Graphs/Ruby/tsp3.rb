def tsp3(file_name = "test.csv")
  inf = 9999999999999999999999999999999
  @raw = Hash.new # key = city id number, value = coordinates [x, y]
  @graph = Hash.new # key = [c1ID, c2ID], value = euclidian distance
  @a = Hash.new #key = [subg in binary string, size], value = shortest 
                #path dist
  @p = Hash.new
  short_paths = Hash.new
  lengths = Hash.new
  a = Array.new 
  starts = Time.now

  i ||= 0

  #read in raw graph
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |node|
      a << node.split("/n")
    end
  end 

  #cleanup graph input and put into a hash
  a.each do |node|
    node[0] = node[0].chomp.split(",")
    node.flatten!
    node[0] = node[0].to_f
    node[1] = node[1].to_f
    @raw[i] = node
    i += 1
  end

  #calculate all distances in raw graph to make graph
  @raw.each_pair do |n1, p1|
    @raw.each_pair do |n2, p2|
      @graph[[n1, n2]] = euc_dist(p1,p2)
    end
  end 

  @input_length = @raw.keys.length
  @base = "1" + "0"* (@input_length - 1)
  all_nodes = "1" * @input_length

  #find min paths for each choice of j in complete graph
  @raw.keys.each do |j|
    puts "node #{j}, #{Time.now - starts}"
    lengths[j], short_paths[j] = answer(all_nodes, j) unless j == 0 
  end

  #find the path + arc back to 0 that is shortest
  final_ans ||= inf
  final_path = Array.new

  lengths.each_pair do |j, ans|
    if ans + @graph[[0,j]] < final_ans
      final_ans = ans + @graph[[0,j]]
      final_path = short_paths[j] << 0
    end
  end

  return final_ans, final_path, @graph
end

def answer(s,j)
  inf = 9999999999999999999999999999999
  if j == 0
    if s == @base
      return 0, [0]
    else
      return inf, [0]
    end
  elsif @a[[s,j]] != nil
    return  @a[[s,j]], @p[[s,j]].clone
  else
    best_ans = inf
    best_k = inf
    best_path = Array.new
    s_prime = s.clone
    s_prime[j] = "0"

    indexes = (0 .. s_prime.length - 1).find_all { |i| s_prime[i,1] == '1' }

    indexes.each do |k|
      pot_ans = inf
      pot_path = Array.new

      pot_ans, pot_path = answer(s_prime,k)
      pot_path = pot_path.clone
      pot_ans += @graph[[j,k]]

      pot_path.push(j) 

      if pot_ans < best_ans
        best_ans = pot_ans
        best_k = k 
        best_path = pot_path
      end
    end
    
    return @a[[s,j]] = best_ans, @p[[s,j]] = best_path.clone
  end
end

def euc_dist(p1,p2)
  xs = (p1[0] - p2[0])*(p1[0] - p2[0])
  ys = (p1[1] - p2[1])*(p1[1] - p2[1])
  dist = Math.sqrt(xs + ys)
end

def time
  start = Time.now
  result = tsp3()
  puts "Completed in #{Time.now - start} seconds."
  result
end