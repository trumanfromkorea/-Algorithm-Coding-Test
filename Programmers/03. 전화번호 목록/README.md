## 프로그래머스 완주하지 못한 선수 (해시)

---

### 1\. 문제

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42577)


전화번호부가 적힌 리스트에서 한 번호가 다른 번호의 접두어인 경우가 있는지 확인하는 문제이다.

---

### 2\. 풀이

전화번호가 담긴 리스트를 탐색하며 find() 를 이용하여 확인하였다.

---

### 3\. 코드

```
def solution(phone_book):
    answer = True
    
    for a in phone_book:
        if answer == False:
            return answer
        for b in phone_book:
            if a.find(b) == 0 and a!=b:
                answer = False
                break
        
    return answer
```