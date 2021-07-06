from itertools import combinations
def solution(number, k):
    result = []
    n = len(number) - k
    number = list(number)
    
    for arr in combinations(number,n):
        result.append(''.join(arr))
    
    return str(max(result))