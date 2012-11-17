def quick_sort_median2(a, l=0, r=a.length-1, m=0)
    m += r - l
    #puts "m is #{m}"

    #base case
    if r == l
        #puts "base case - l is #{l} and r is #{r}"
        a
    #all other cases
    else 
        #choose pivot
	    if r - l >= 2         
	        pivot_name, pivot = pivot_chooser(a,l,r)
            #puts "pivot is #{pivot} pivot name is #{pivot_name}"
            if pivot_name == 'first'
            else 
                a[pivot],a[l]=a[l],a[pivot]
            end

            #puts "after pivot_changer - a is #{a}"
        else
            pivot_name = 'first'
            pivot = l
        end 

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
            a,m = quick_sort_median2(a,l,i - 2,m)
            #puts "after left call - m is #{m}"
            #puts "left done"
        end
        if r >= i
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,m = quick_sort_median2(a,i,r,m)
            #puts "after right call - m is #{m}"
            #puts "right done"
        end
    end
    #puts "m end is #{m}"
    return a, m
end

def pivot_chooser(a, l=0, r=a.length-1)
    #puts "inside pivot_choose - a is #{a[l...r]}"
    len = r - l + 1
    mid_index = len % 2 == 0 ? len/2 - 1 + l : len/2 + l
    #puts "inside pivot_choose - mid_index is #{mid_index}"
    
    b,s = quick_sort_first([a[l],a[mid_index],a[r]])
    #puts "inside pivot_choose - array is #{b} a is #{a[l...r]}"

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
    #puts "s is #{s}"

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
            a,s = quick_sort_first(a,l,i - 2,s)
            #puts "after left call -s is #{s}"
            #puts "left done"
        end
        if r >= i
            #puts "new right recursion - a is #{a},  new_i is #{new_i}, r is #{r}"
            a,s = quick_sort_first(a,i,r,s)
            #puts "after right call - s is #{s}"
            #puts "right done"
        end
    end
    #puts "s end is #{s}"
    return a, s
end

