# -*- coding: utf-8 -*-
""" programmers 모의고사
    https://programmers.co.kr/learn/courses/30/lessons/42840
"""

answers = [1,3,2,4,2]

import math
def solution(answers):
    answer = []
    
    student_1 = [1,2,3,4,5]
    student_2 = [2,1,2,3,2,4,2,5]
    student_3 = [3,3,1,1,2,2,4,4,5,5]
    
    dic = {1:0, 2:0, 3:0}
    
    if len(answers) > len(student_1):
        multi = math.ceil(len(answers)/len(student_1)) 
        student_1 = student_1 * multi
    
    if len(answers) > len(student_2):
        multi = math.ceil(len(answers)/len(student_2)) 
        student_2 = student_2 * multi
    
    if len(answers) > len(student_3):
        multi = math.ceil(len(answers)/len(student_3)) 
        student_3 = student_3 * multi
    
    for a,b in zip(answers,student_1):
        if a == b:
            dic[1] += 1
    
    for a,b in zip(answers,student_2):
        if a == b:
            dic[2] += 1
            
    for a,b in zip(answers,student_3):
        if a == b:
            dic[3] += 1
            
    answer = [k for k,v in dic.items() if max(dic.values()) == v]
    
    return answer

print(solution(answers))

