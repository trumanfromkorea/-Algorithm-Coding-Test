def solution(n, lost, reserve):
    
    if len(lost) == 0:
        return n
    
    answer = 0
    
    X_lost = set(lost) - set(reserve)
    X_reserve = set(reserve) - set(lost)
    
    answer += n - len(X_lost) 
    
    print(lost,reserve)
    
    for i in X_reserve:
        if i-1 in X_lost:
            X_lost.remove(i-1)
            answer += 1
        elif i+1 in X_lost:
            X_lost.remove(i+1)
            answer += 1
    
    return answer