# -*- coding: utf-8 -*-
""" programmers K번째 수
    https://programmers.co.kr/learn/courses/30/lessons/42748
"""

def solution(array, commands):
  answer = []

  for arr in commands:
    new_array = array[arr[0]-1:arr[1]]
    new_array.sort()
    result = new_array[arr[2]-1]
    answer.append(result)
  
  return answer
