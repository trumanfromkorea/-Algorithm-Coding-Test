# -*- coding: utf-8 -*-
""" programmers 전화번호 목록
    https://programmers.co.kr/learn/courses/30/lessons/42577
"""

phone_book = ["119", "97674223", "1195524421"]

def solution(phone_book):
    answer = True
    flag = True
    
    for a in phone_book:
        if flag == False:
            break
        for b in phone_book:
            if a.find(b) == 0 and a!=b:
                answer = False
                flag = False
                break
        
    return answer

print(solution(phone_book))

