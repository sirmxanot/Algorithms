def quick_sort_median(a, l=0, r=a.length-1, m=0)
    m += r - l
    #puts "m is #{m}"

    #base case
    if r == l
        #puts "base case - l is #{l} and r is #{r}"
        a
    #all other cases
    else 
        #initialize variables
        i = l
        pivot_name, pivot = privot_chooser(a,l,r)

        for j in l...r
            #puts "inside for loop - j is #{j}, r is #{r}"
            if a[j] < a[r]
                #puts "inside if - a[j] is #{a[j]} a[i] is #{a[i]}"
                a[j],a[i]=a[i],a[j]
                i += 1
            end
        end
        #puts "right after for - a[l] is #{a[l]} a[i] is #{a[i]}"
        a[r],a[i]=a[i],a[r]
        #puts "else case - l is #{l} and r is #{r}"
        
        if i-1 >= l
            #puts "new left recursion - a is #{a}, l is #{l} i is #{i}"
            a,m = quick_sort_median(a,l,i-1,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i + 1
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_median(a,i+1,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end

def pivot_chooser(a, l=0, r=a.length-1)
    len = r - l + 1
    mid_index = len % 2 == 0 ? len/2 : len/2+1
    
    b,s = quick_sort_first([a[l],a[mid_index],a[r]])

    if b[2] == a[l]
        return first,l
    elsif b[2] == a[mid_index]
        return middle,mid_index
    elsif b[2] == a[r]
        return last,r
    end        
end

def quick_sort_first(a, l=0, r=a.length-1, m=0)
    m += r - l
    #puts "m is #{m}"

    #base case
    if r == l
        #puts "base case - l is #{l} and r is #{r}"
        a
    #all other cases
    else 
        #initialize variables
        i = l + 1
        for j in i...r + 1
            #puts "inside for loop - j is #{j}, r is #{r}"
            if a[j] < a[l]
                #puts "inside if - a[j] is #{a[j]} a[i] is #{a[i]}"
                a[j],a[i]=a[i],a[j]
                i += 1
            end
        end
        #puts "right after for - a[l] is #{a[l]} a[i] is #{a[i]}"
        a[l],a[i - 1]=a[i - 1],a[l]
        #puts "else case - l is #{l} and r is #{r}"
        
        if i - 2 >= l
            #puts "new left recursion - a is #{a}, l is #{l} i is #{i}"
            a,m = quick_sort_first(a,l,i - 2,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_first(a,i,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end
