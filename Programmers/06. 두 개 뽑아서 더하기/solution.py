from itertools import permutations
def solution(numbers):
    answer = []
    
    permute = permutations(numbers,2)
    result = set()
    
    for arr in list(permute):
        result.add(sum(arr))
    
    answer = sorted(list(result))
    
    return answer