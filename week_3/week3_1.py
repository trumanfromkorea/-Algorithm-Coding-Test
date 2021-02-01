# -*- coding: utf-8 -*-
""" programmers 기능개발
    https://programmers.co.kr/learn/courses/30/lessons/42586
"""

progresses = [93,30,55]
speeds = [1,30,5]

def solution(pro, sp):
  answer = []
  pro_d = deque(pro)
  sp_d = deque(sp)

  while pro_d:
    cnt = 0
    pro_d = deque([x+y for x,y in zip(pro_d,sp_d)])
    check = pro_d.popleft()

    while check >= 100:
      sp_d.popleft()
      cnt += 1
      if not pro_d:
        break
      check = pro_d.popleft()
    
    if check < 100:
      pro_d.appendleft(check)

    if cnt > 0:
      answer.append(cnt)
  
  return answer

solution(progresses,speeds)

