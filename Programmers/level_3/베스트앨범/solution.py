def solution(genres, plays):
    answer = []
    dic = {}
    
    for g,p in zip(genres,plays):
        if g in dic.keys():
            dic[g] += p
        else:
            dic.setdefault(g,p)
            
    sdic = (sorted(dic.items(), reverse=True, key=lambda x: x[1]))
    
    for G in sdic:
        V = []
        P = []
        I = []
        for i,val in enumerate(genres):
            if G[0] == val:
                P.append(plays[i])
                I.append(i)
                
        max1 = P.index(max(P))
        answer.append(I[max1])
        del P[max1]
        del I[max1]
        if P:
            max2 = P.index(max(P))
            answer.append(I[max2])
    
    return answer