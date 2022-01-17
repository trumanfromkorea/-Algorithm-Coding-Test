import math
def solution(n, words):
    answer = []
    index = 0
    
    isWrong = False
    counts = {}
    
    while words:
        index += 1
        now = words.pop(0)
        
        if now in counts:
            isWrong = True
            break
        
        counts[now] = True
        
        if index == 1:
            prev = now
            continue
        
        if now[0] != prev[-1]:
            isWrong = True
            break
        
        prev = now
    
    turn = math.ceil(index/n)
    
    who = index % n
    if who == 0:
        who = n
    
    if not isWrong:
        return [0,0]
    else:
        return [who, turn]