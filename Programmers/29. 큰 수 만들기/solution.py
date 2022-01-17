def solution(number, k):
    result = []
    s = len(number) - k
    number = list(number)

    for n in number:
        if not result:
            result.append(n)
            continue
        
        while result and result[-1] < n and k > 0:
            result.pop()
            k -= 1
            
        result.append(n)
        
    return ''.join(result[:s])