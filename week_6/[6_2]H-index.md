## [코딩테스트] Programmers 2단계 - H-Index
---
### 1. 문제
---
[문제링크] (https://programmers.co.kr/learn/courses/30/lessons/42747) <br>
주어진 논문의 n 편 중, h 번 이상 인용된 논문이 h 편 이상이고 나머지 논문이 h 번 이하 인용되었다면 h 의 최댓값이 이 과학자의 H-Index 이다.

### 2. 풀이
---
논문의 길이만큼 반복문을 실행한다. 실행 시 h 변수를 0 으로 초기화하고 주어진 논문의 원소 값으로 반복문을 한번 더 실행한다. 이 때 인용된 횟수의 대소관계를 비교하여 h 에 1 을 추가해주고, 이후 빈 배열에 원소를 추가시킨다. 마지막으로 완성된 배열의 최대값을 리턴한다.

### 3. 코드
---
    def solution(citations):
        answer = 0
        
        arr = []
        
        for i in range(0,len(citations)):
            h = 0
            for key in citations:
                if key >= i:
                    h += 1
            
            if h >= i:
                arr.append(i)
        
        return max(arr) 


