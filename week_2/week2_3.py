# -*- coding: utf-8 -*-
""" programmers 주식가격
    https://programmers.co.kr/learn/courses/30/lessons/42584
"""

answers = [1,2,3,2,3]

from collections import deque
def solution(prices):
    answer = []
    price = deque(prices)
    
    while price:
        result = []        
        n = price.popleft()
        
        for i in price:
            result.append(i)
            if n > i:
                break
        
        answer.append(len(result))
        
    return answer

print(solution(answers))

