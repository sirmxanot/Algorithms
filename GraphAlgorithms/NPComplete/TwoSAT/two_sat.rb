#uses a modification of the strongly connected components algoritm
#to determine if a 2sat solution exists
def two_sat(file_name = "test_data/test.txt")
  graph = Hash.new #key source node, value all endpts
  reverse_graph = Hash.new #key end pt, value all source nodes
  @leaders = Hash.new #key leader name, value nodes in leaders scc
  order = Array.new #holds nodes in order specified by first dfs loop
  @finish_times = Hash.new #key node name, value finishing time
  ans = 1

  #read in raw graph
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |node|
      a,b = node.split
      a = a.to_i
      b = b.to_i

      #load graph
      if graph.has_key?(-a)
        graph[-a].push(b)
      else
        graph[-a] = [b]
      end

      if graph.has_key?(-b)
        graph[-b].push(a)
      else
        graph[-b] = [a]
      end
    end
    puts "finished loading files"
  end 

  #initial dfs to determine order for second dfs
  puts "reverse"
  @t = 0 #number of nodes processed so far

  graph.each_key do |node|
    if @finish_times[node].nil?
      @source = node
      depth_first_search(graph, node)
    end
  end

  #specify order for second sort
  puts "specify order"
  order = @finish_times.invert
  order = Hash[order.sort]

  #run dfs a second time
  puts "forward"
  @leaders = Hash.new
  @finish_times = Hash.new
  @t = 0

  order.each_value do |node|
    if @finish_times[node].nil?
      @source = node
      depth_first_search(graph, node)
    end
  end

  #check if any scc includes any node and its -node
  puts "final check"
  @leaders.each_value do |scc|
    scc.each do |n|
      ans = 0 if scc.include?(-n)
    end
  end

  return ans
end

def depth_first_search(graph, node)
  s = @source

  if @leaders[s].nil?
    @leaders[s] = [node]
  else
    @leaders[s].push(node)
  end

  @finish_times[node] = 0

  if graph[node] != nil
    graph[node].each do |arc|
      if @finish_times[arc].nil?
        depth_first_search(graph, arc)
      end
    end
  end

  @t += 1
  @finish_times[node] = @t
end

def time
  answer = Array.new
  start = Time.now
  answer << two_sat('2sat1.txt') 
  puts "1 done #{Time.now - start} answer #{answer}"
  answer << two_sat('2sat2.txt')
  puts "2 done #{Time.now - start} answer #{answer}"
  answer << two_sat('2sat3.txt')
  puts "3 done #{Time.now - start} answer #{answer}"
  answer << two_sat('2sat4.txt')
  puts "4 done #{Time.now - start} answer #{answer}"
  answer << two_sat('2sat5.txt')
  puts "5 done #{Time.now - start} answer #{answer}"
  answer << two_sat('2sat6.txt')
  puts "6 done #{Time.now - start} answer #{answer}"

  puts "Completed in #{Time.now - start} seconds."
  return answer
end