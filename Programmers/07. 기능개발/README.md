## 프로그래머스 기능개발 (스택/큐)
---
### 1. 문제 <br>
[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42586) <br>

 개발이 진행되고 있는 서비스가 담긴 리스트가 있고, 각 서비스의 개발속도 리스트가 존재한다. 기능이 앞에 있는 기능보다 먼저 개발될 수 있으며 이가 완성된다고 하더라도 앞에 있는 기능이 배포될 때 함께 배포된다. (맨 앞쪽부터 배포된다는 뜻이다.) <br>

---
### 2. 풀이 <br>

카테고리가 스택/큐이기 때문에 덱을 사용했다. 반복문 내에서 각 기능에 개발되는 속도를 더해주었고 변수를 선언하여 가장 앞 쪽 기능이 완성되었는지 상시 확인하였다. 기능이 완성되면 기능의 개발속도를 제거해주고, 뒤쪽의 기능들이 개발되었는지 확인해주었다.이때 변수를 선언하여 1씩 추가하여 주었고 이를 answer 리스트에 추가하여 리턴하였다. <br>

---

### 3. 코드
```{.python}
from collections import deque
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
```
