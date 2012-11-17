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
        pivot_name, pivot = pivot_chooser(a,l,r)
        puts "pivot is #{pivot} pivot name is #{pivot_name}"
        if pivot_name == 'last'
        else 
            a[pivot],a[r]=a[r],a[pivot]
        end

        puts "after pivot_changer - a is #{a}"

        #initialize variables
        i = l 
        for j in i...r
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
        
        if i - 1 >= l
            #puts "new left recursion - a is #{a}, l is #{l} i is #{i}"
            a,m = quick_sort_median(a,l,i - 1,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i + 1
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_median(a,i + 1,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end

def pivot_chooser(a, l=0, r=a.length-1)
    puts "inside pivot_choose - a is #{a}"
    len = r - l + 1
    mid_index = len % 2 == 0 ? len/2 - 1: len/2
    puts "inside pivot_choose - mid_index is #{mid_index}"
    
    b,s = quick_sort_last([a[l],a[mid_index],a[r]])
    puts "inside pivot_choose - array is #{b} a is #{a}"

    if b[1] == a[l]
        return 'first',l
    elsif b[1] == a[mid_index]
        return 'middle',mid_index
    elsif b[1] == a[r]
        return 'last',r
    end        
end

def quick_sort_last(a, l=0, r=a.length-1, m=0)
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
        for j in i...r
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
        
        if i - 1 >= l
            #puts "new left recursion - a is #{a}, l is #{l} i is #{i}"
            a,m = quick_sort_last(a,l,i - 1,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i + 1
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_last(a,i + 1,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end

