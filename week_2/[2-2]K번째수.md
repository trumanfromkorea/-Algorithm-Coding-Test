## 프로그래머스 - K번째수 <br>
---
### 1. 문제 <br>
[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42748) <br>

배열의 i 번째 숫자부터 j 번째 숫자부터 자르고 정렬한 후 k 번째에 있는 수를 구하는 문제이다. <br>

---
### 2. 풀이 <br>

주어진 변수를 이용하여 배열을 슬라이싱한 다음 정렬해주었다. result 변수에 k 번째 수를 저장하고 이를 answer 에 추가한 후 리턴하였다. <br>

---

### 3. 코드
```{.python}
def solution(array, commands):
    answer = []
    
    for arr in commands:
        new_array = array[arr[0]-1:arr[1]]
        new_array.sort()
        result = new_array[arr[2]-1]
        answer.append(result)
    
    return answer
```
