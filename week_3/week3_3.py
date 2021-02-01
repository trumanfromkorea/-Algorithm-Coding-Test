# -*- coding: utf-8 -*-
""" programmers 가장 큰 수
    https://programmers.co.kr/learn/courses/30/lessons/42746
"""

numbers = [6,10,2]

from itertools import permutations
def solution(numbers):
    answer = ''
    # options = []
    # permute = list(permutations(numbers,len(numbers)))
    # options = [''.join(map(str,arr)) for arr in permute]
    # answer = max(options)
    
    answer = sorted(list(map(str,numbers)), key = lambda x: x*4, reverse = True)
    
    return str(int(''.join(answer)))

solution(numbers)

