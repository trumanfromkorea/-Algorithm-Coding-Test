## 프로그래머스 - 더 맵게 (힙 Heap)

---

### 1\. 문제

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42626)


음식의 매운 정도인 스코빌 지수가 담긴 리스트가 있다. 모든 음식의 스코빌 지수가 K 이상이 될 때까지 음식을 섞는다. 모든 음식의 스코빌 지수를 K 이상으로 만들 수 없는 경우에는 -1 을 return

---

### 2\. 풀이

알고리즘 공부를 한지 너무 오래되서 힙에 대한 기억이 가물가물 하였다. 학교에서는 C 로 힙을 공부했었는데 파이썬은 역시나 라이브러리가 있으니 편하다. heapq 를 import 해주고 주어진 리스트를 최소 힙으로 만들어 주었다. 가장 작은 값이 K 보다 작을 동안 반복문 내에서 음식을 섞어주었고, heappush 를 이용해 값을 다시 추가함으로써 힙을 유지하였다.

---

### 3\. 코드

```
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
```
