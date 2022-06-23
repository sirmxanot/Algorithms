def aboveAverageSubarrays(a):
    output = []
    a_sum = sum(a)
    n = len(a)
    for l in range(len(a)):
        cum_sub_sum = 0
        for r in range(l,len(a)):
            cum_sub_sum += a[r]
            sub_count = r-l+1
            sub_score = cum_sub_sum/sub_count
            rem_count = n-sub_count
            if rem_count > 0:
                rem_score = (a_sum-cum_sub_sum)/rem_count
    
            if sub_score > rem_score or rem_count == 0:
                output.append([l+1,r+1])
    return output


if __name__ == "__main__":
    print(aboveAverageSubarrays([3,4,2]))