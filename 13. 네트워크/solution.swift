// 프로그래머스 - 네트워크

import Foundation

var visited: [Bool] = Array(repeating: false, count: 200)

func DFS(x: Int, n: Int, computers: [[Int]]) {
    visited[x] = true

    for i in 0 ..< n {
        if visited[i] == false && computers[x][i] == 1 {
            DFS(x: i, n: n, computers: computers)
        }
    }
}

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    var answer: Int = 0

    for i in 0 ..< n {
        if visited[i] == false {
            DFS(x: i, n: n, computers: computers)
            answer += 1
        }
    }

    return answer
}

var result: Int = solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])

print(result)
