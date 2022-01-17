def solution(n):
    answer = ''
    
    while n > 0:
        rest = n%3
        n = int(n/3)
    
        if rest == 0:
            n -= 1
            rest = 4

        answer = str(rest) + answer
    
    return answer