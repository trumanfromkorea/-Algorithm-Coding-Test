# -*- coding: utf-8 -*-
""" programmers 완주하지 못한 선수
    https://programmers.co.kr/learn/courses/30/lessons/42576
"""

def solution(participant, completion):
  temp = 0
  dic = {}
  
  for part in participant:
    dic[hash(part)] = part
    temp += int(hash(part))

  for com in completion:
    temp -= hash(com)

  answer = dic[temp]
  return answer
