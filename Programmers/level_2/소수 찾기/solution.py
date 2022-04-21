from itertools import permutations
import math

def solution(numbers):
    answer = 0
    
    permutedArray = []
    
    for i in range(1, len(numbers) + 1):
        tempArray = list(permutations(numbers,i))
        
        for item in tempArray:
            permutedArray.append(''.join(item))
    
    permutedArray = list(set(list(map(int,permutedArray))))
    
    for p in permutedArray:
        isAnswer = 1
        if p == 1 or p == 0 :
            continue
            
        for i in range(2, p):
            if p % i == 0 :
                isAnswer = 0
                break
        
        answer += isAnswer
            
            
    
    return answer
