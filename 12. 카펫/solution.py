def solution(brown, yellow):
    answer = []
    divisor = []
    
    for i in range(1,yellow + 1):
        if yellow % i == 0:
            divisor.append(i)
    
    while divisor:
        if len(divisor) == 1:
            one = divisor.pop()
            answer.append(one+2)
            answer.append(one+2)
            return answer
        
        width = divisor.pop()
        height = divisor.pop(0)
        
        expected = width * 2 + height * 2 + 4
        
        if brown == expected:
            answer.append(width+2)
            answer.append(height+2)
            return answer
        
    
    return answer