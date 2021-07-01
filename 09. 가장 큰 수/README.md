## 프로그래머스 - 가장 큰 수 
---
### 1. 문제 <br>
[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42746) <br>

주어진 숫자의 리스트를 재배치하여 가장 큰 수를 리턴한다. <br>

---
### 2. 풀이 <br>

permutations 을 사용하면 아주 쉽게 풀 수 있는 문제라고 생각하여 모든 경우의 수를 탐색하였다. 하지만 효율성이 너무 떨어져 테스트를 통과하지 못했다. 구글링을 하던 도중, 모든 자리수를 4자리수로 만들어 비교를 하면 되겠다고 생각하였다. map 을 이용하여 문자열로 모두 변환시켜준뒤 같은 숫자를 4번씩 반복하여 4자리수를 만들어 준다음 비교 정렬하였다. 이를 int 로 한번 변환하고 str 로 다시 변환시켜 주었는데, 이는 "0000" 과 같은 숫자를 방지하기 위함이다.  <br>

---

### 3. 코드 <br>
주석 처리한 부분은 기존에 permutations 로 풀어본 방식이다. <br>
```{.python}
#from itertools import permutations
def solution(numbers):
    answer = ''
    # options = []
    # permute = list(permutations(numbers,len(numbers)))
    # options = [''.join(map(str,arr)) for arr in permute]
    # answer = max(options)
    answer = sorted(list(map(str,numbers)), key = lambda x: x*4, reverse = True)
    
    return str(int(''.join(answer)))
```
