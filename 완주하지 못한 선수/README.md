## 프로그래머스 완주하지 못한 선수 (해시)

---

### 1\. 문제

[문제링크](https://programmers.co.kr/learn/courses/30/lessons/42576)


참여자 리스트와 완주자 리스트가 있다. 이 둘을 비교하여 완주하지 못한 선수 한명을 가려내는 문제이다.

---

### 2\. 풀이

역시 C 언어에 익숙하기 때문에 뭔가 2중 for문으로 인덱스를 활용해 풀어야할것 같지만, 카테고리가 해시이기 때문에 해시를 이용했다. 딕셔너리를 선언하여 참여자들의 정보를 저장하고 temp 변수에 계속하여 해시 주소를 더해주었다. 이후 완주자들의 해시를 temp 변수에서 빼내어주며 마지막 남은 해시 주소로 미완주자를 가려내었다.

---

### 3\. 코드

```
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
```