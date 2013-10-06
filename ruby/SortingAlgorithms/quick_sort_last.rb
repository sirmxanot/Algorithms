def quick_sort_last(a, l=0, r=a.length-1, m=0)
  m += r - l

  #base case
  if r == l
    a
  #all other cases
  else 
    #initialize variables
    i = l + 1
    a[l],a[r]=a[r],a[l]

    for j in i...r + 1
      if a[j] < a[l]
        a[j],a[i]=a[i],a[j]
        i += 1
      end
    end

    a[l],a[i - 1]=a[i - 1],a[l]

    if i - 2 >= l
      a,m = quick_sort_last(a,l,i - 2,m)
    end

    if r >= i
      a,m = quick_sort_last(a,i,r,m)
    end
  end

  return a, m
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
  a = []
  b = [-88,88,3,-22,1,2,3,0]
  c = [1,2,3,4,5]
  d = [5,4,3,2,1]
  e = "1,2,3,4"
  f = [1,"b",3,4]

  puts quick_sort_last(a).shift == [nil]
  puts quick_sort_last(b).shift == [-88,-22,0,1,2,3,3,88]
  puts quick_sort_last(c).shift == [1,2,3,4,5]
  puts quick_sort_last(d).shift == [1,2,3,4,5]
  puts quick_sort_last(read_file).pop == 2047196
end