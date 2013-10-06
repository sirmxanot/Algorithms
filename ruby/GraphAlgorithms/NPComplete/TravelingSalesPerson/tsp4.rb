def read_file(file_name = "test_data/tsp.csv")
  inf = 9999999999999999999999999999999
  @r = Hash.new # key = city id number, value = coordinates [x, y]
  @g = Hash.new # key = [c1ID, c2ID], value = euclidian distance

  a = Array.new 
  starts = Time.now

  i ||= 0

  #read in r g
  File.open(file_name, "r") do |file_handle|
    file_handle.each_line do |node|
      a << node.split("/n")
    end
  end 

  #cleanup g input and put into a hash
  a.each do |node|
    node[0] = node[0].chomp.split(",")
    node.flatten!
    node[0] = node[0].to_f
    node[1] = node[1].to_f
    @r[i] = node
    i += 1
  end

  #calculate all distances in r g to make g
  @r.each_pair do |n1, p1|
    @r.each_pair do |n2, p2|
      @g[[n1, n2]] = euc_dist(p1,p2)
    end
  end 
end

def time
  require 'tsp3.rb'
  start = Time.now
  half1, path1 = tsp3("test_data/test1.csv")  
  half2, path2 = tsp3("test_data/test2.csv")
  read_file()
  puts "Completed in #{Time.now - start} seconds."
  return half1, path1, half2, path2, @g
end