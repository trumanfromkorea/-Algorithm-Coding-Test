def solution(clothes):
    dic = {}
    for cloth in clothes:
        if cloth[1] in dic:
            dic[cloth[1]] += 1
        else:
            dic.setdefault(cloth[1],1)
    
    answer = 1
    
    for key,values in dic.items():
        answer *= values + 1
    
    return answer - 1