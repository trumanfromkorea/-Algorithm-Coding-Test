def solution(length, weight, trucks):
    answer = 0
    crossing = [0] * length
    
    while trucks or crossing:
        answer += 1
        crossing.pop(0)
        
        if trucks:
            if sum(crossing) + trucks[0] <= weight:
                crossing.append(trucks.pop(0))
            else:
                crossing.append(0)
    
    return answer