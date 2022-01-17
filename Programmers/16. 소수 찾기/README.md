## [코딩테스트] Programmers 2단계 - 소수 찾기
---
### 1. 문제
---
[문제링크] (https://programmers.co.kr/learn/courses/30/lessons/42839) <br>
주어진 숫자들로 몇 개의 소수를 만들 수 있는지 찾는다.

### 2. 풀이
---
먼저 주어진 숫자들로 만들 수 있는 모든 숫자의 조합을 만든다. 이후 중복을 제거한다. 반복문 안에서 1 부터 해당 수의 제곱근까지 숫자를 나눠본 후 나머지가 없는 숫자가 있다면 배열에 추가한다. 이후 배열의 크기를 리턴한다.

### 3. 코드
---
    from itertools import permutations
    import math
    def solution(numbers):
        answer = []
        storage = []
        numbers = list(numbers)
        
        for i in range(1,len(numbers)+1):
            for arr in list(permutations(numbers,i)):
                storage.append(''.join(arr))
        
        storage = list(set(list(map(int,storage))))
        
        for num in storage:
            flag = 0
            sqrt = int(math.sqrt(num))
            if num != 1 and num != 0:
                for i in range(2,sqrt+1):
                    if num%i == 0:
                        flag = 1

            if flag == 0 and num != 1 and num != 0:
                answer.append(num)
        
        return len(answer)



