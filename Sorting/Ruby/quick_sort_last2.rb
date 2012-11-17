def quick_sort_last2(a, l=0, r=a.length-1, m=0)
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
        a[l],a[r]=a[r],a[l]
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
            a,m = quick_sort_last2(a,l,i - 2,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_last2(a,i,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end
