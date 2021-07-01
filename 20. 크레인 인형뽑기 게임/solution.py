import numpy as np

def solution(board, moves):
    answer = 0
    
    cnt = 0
    board = np.array(board).T
    board = board.tolist()
    stack = []

    for i in moves:
        check = 0
        for idx,val in enumerate(board[i-1]):
            if val != 0:
                check = val
                board[i-1][idx] = 0
                break
                
        if check == 0:
            continue

        if stack and stack[-1] == check:
            stack.pop()
            answer += 2
        else:
            stack.append(check)
    
    return answer