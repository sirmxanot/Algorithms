def quick_sort_first(a, l=0, r=a.length-1, m=0)
  m += r - l

  #base case
  if r == l
    a 
  #all other cases
  else 
    #initialize variables
    i = l + 1
    for j in i...r + 1
      if a[j] < a[l]
        a[j],a[i]=a[i],a[j]
        i += 1
      end
    end

    a[l],a[i - 1]=a[i - 1],a[l]
    
    if i - 2 >= l
      a,m = quick_sort_first(a,l,i - 2,m)
    end

    if r >= i
      a,m = quick_sort_first(a,i,r,m)
    end
  end

  return a, m
end
