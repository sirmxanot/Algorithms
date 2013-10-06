def quick_sort_median(a, l=0, r=a.length-1, m=0)
  m += r - l

  #base case
  if r == l
    a
  #all other cases
  else 
    #choose pivot
    if r - l >= 2         
      pivot_name, pivot = pivot_chooser(a,l,r)

      if pivot_name == 'first'
      else 
        a[pivot],a[l]=a[l],a[pivot]
      end

    else
      pivot_name = 'first'
      pivot = l
    end 

    i = l + 1
    
    for j in i...r + 1
      if a[j] < a[l]
        a[j],a[i]=a[i],a[j]
        i += 1
      end
    end

    a[l],a[i - 1]=a[i - 1],a[l]
    
    if i - 2 >= l
      a,m = quick_sort_median(a,l,i - 2,m)
    end

    if r >= i
      a,m = quick_sort_median(a,i,r,m)
    end
  end

  return a, m
end

def pivot_chooser(a, l=0, r=a.length-1)
  len = r - l + 1

  mid_index = len % 2 == 0 ? len/2 - 1 + l : len/2 + l
  
  b,s = quick_sort_first([a[l],a[mid_index],a[r]])

  if b[1] == a[l]
    return 'first',l
  elsif b[1] == a[mid_index]
    return 'middle',mid_index
  elsif b[1] == a[r]
    return 'last',r
  end        
end

def quick_sort_first(a, l=0, r=a.length-1, s=0)
  s += r - l

  #base case
  if r == l
    a
  #all other cases
  else 
    i = l + 1

    for j in i...r + 1
      if a[j] < a[l]
        a[j],a[i]=a[i],a[j]
        i += 1
      end
    end

    a[l],a[i - 1]=a[i - 1],a[l]
    
    if i - 2 >= l
      a,s = quick_sort_first(a,l,i - 2,s)
    end

    if r >= i
      a,s = quick_sort_first(a,i,r,s)
    end
  end

  return a, s
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

  puts quick_sort_median(a).shift == [nil]
  puts quick_sort_median(b).shift == [-88,-22,0,1,2,3,3,88]
  puts quick_sort_median(c).shift == [1,2,3,4,5]
  puts quick_sort_median(d).shift == [1,2,3,4,5]
  puts quick_sort_median(read_file).pop == 1697653
end

