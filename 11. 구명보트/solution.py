from collections import deque
def solution(people, limit):
    answer = 0
    people.sort()
    people = deque(people)
    
    while people:
        answer += 1
        min = people.popleft()
        
        if not people:
            return answer
        
        max = people.pop()
        
        if min + max > limit:
            people.appendleft(min)
        
    return answer