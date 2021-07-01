def dfs(visited, idx, n, computers):
    visited[idx] = 1
    print(idx)

    for i in range(n):
        if visited[i] == 0 and computers[idx][i] == 1:
            dfs(visited, i, n, computers)

    return visited

def solution(n, computers):
    answer = 0
    visited = [0] * n

    for i in range(n):
        if visited[i] == 0:
            dfs(visited, i, n, computers)
            answer += 1


    return answer