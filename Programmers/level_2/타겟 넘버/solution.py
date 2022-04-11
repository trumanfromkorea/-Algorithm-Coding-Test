from itertools import product
def solution(numbers, target):
    answer = 0
    
    coin = [(x,-x) for x in numbers]
    multi = list(product(*coin))
    
    for arr in multi:
        if sum(arr) == target:
            answer += 1
    
    return answer