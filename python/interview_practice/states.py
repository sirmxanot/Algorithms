def answerQueries(queries,n):
    states = [False]*(n+1)
    ans = []
    for query_type,index in queries:
        if query_type == 1: #SET
            states[index] = True
        else: #GET
            i = index
            next_true = -1
            while i < len(states) and states[i] == False:
                i += 1
                
            if i < len(states):
                next_true = i
            
            ans.append(next_true)
            
    return ans

if __name__ == "__main__":
    print(answerQueries([[2, 3], [1, 2], [2, 1], [2, 3], [2, 2]],5))