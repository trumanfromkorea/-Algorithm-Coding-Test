# -*- coding: utf-8 -*-
""" programmers 더 맵게
    https://programmers.co.kr/learn/courses/30/lessons/42626
"""

scoville = [1,2,3,9,10,12]
K = 2

import heapq
def solution(scoville, K):
    answer = 0
    heapq.heapify(scoville)
    
    while scoville[0] < K:
        if len(scoville) == 1:
             return -1
        
        a = heapq.heappop(scoville)
        b = heapq.heappop(scoville)
        mixed = a + b*2
        answer += 1
        heapq.heappush(scoville,mixed)
        
    return answer

print(solution(scoville,K))
