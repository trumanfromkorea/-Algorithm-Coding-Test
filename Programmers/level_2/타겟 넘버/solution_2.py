answer = 0

def solution(numbers, t):

    global answer
    
    target = t
    
    DFS(0, numbers, 0, target, True)
    DFS(0, numbers, 0, target, False)

    return answer / 2

def DFS(index, numbers, num, target, std):
    global answer 
    
    if index == len(numbers):
        if num == target:
            answer += 1
        return
    
    next = 0
    
    if std:
        next = num + numbers[index]
    else:
        next = num - numbers[index]       
    
    DFS(index + 1, numbers, next, target,  True)
    DFS(index + 1, numbers, next, target,  False)
