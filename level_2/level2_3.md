## [코딩테스트] Programmers 2단계 - 주식가격
---
### 1. 문제
---
초 단위로 주식가격이 담긴 배열 하나를 입력받아 각 주식이 몇 초 동안 가격이 떨어지지 않았는지에 대한 정보를 새로운 배열에 담아 return 하는 문제였다. 당연히 2중으로 반복문을 사용해야 한다고 생각했고, 문제의 카테고리가 스택/큐 이기 때문에 큐를 이용해 dequeue 한 값과 나머지를 탐색하는 방식으로 문제에 접근하였다.

### 2. 시행착오
---
처음에는 cnt 라는 int 형 변수를 선언하여 0 으로 초기화 시켜준 뒤 주식의 가격이 떨어지지 않을때마다 cnt 에 1 을 더해줬다. 그리고 반복문의 끝부분에서 answer 배열에 cnt 를 append 해주었다. Queue 를 이용하려고 하였으나 입력값인 prices 배열을 Queue(prices) 를 이용하여 데이터 타입을 변환하자 원소들의 탐색이 불가능하다는 점을 깨달았다. 그래서 list 형태를 계속 이용하되, queue 의 특성인 FIFO 를 이용하여 맨 앞의 원소들을 차례대로 제거해주었다. 테스트 데이터들과 채점 시 정확성은 모두 만점이었지만, 효율성 문제에서 시간초과가 발생하였다. 아래는 해당 코드이다.

    def solution(prices):
        answer = []
        price = prices[:]
        
        while price:
            cnt = 0
            com = price[0]
            del price[0]
            
            for i in com:
                cnt += 1
                if tmp > i:
                    break
            
            answer.append(cnt)
        
        return answer
        
Queue 의 특성이라도 사용해보자, 라고 생각하며 list 형식으로 된 데이터를 enqueue 하듯이 0 번째 인덱스의 원소를 지워나가는 방식으로 코드를 작성하였지만, 효율성 문제에서 계속 시간초과가 발생하였다. 그래서 이용한 것이 collections 에서 import 한 deque 이다. 양방향 queue 로 이전에 선언했던 것과 달리 탐색이 가능하였다. list 에서의 원소 탐색 시 시간복잡도는 O(n) 이지만 stack, queue, deque 에서는 가장 상위의 원소나 가장 하위의 원소만을 탐색하기 때문에 시간복잡도가 O(1) 이 걸린다는 것을 알게 되었다. 아래는 해당 코드이다.

    from collections import deque
    def solution(prices):
        answer = []
        price = deque(prices)
    
    while price:
        result = []        
        n = price.popleft()
        
        for i in price:
            result.append(i)
            if n > i:
                break
        
        answer.append(len(result))
        
    return answer



