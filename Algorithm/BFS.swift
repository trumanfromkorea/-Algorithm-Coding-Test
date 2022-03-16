// BFS

import Foundation

// 그래프 - 인접행렬
let graphTable: [[Int]] = [
    [0, 1, 1, 1, 0, 0, 0],
    [1, 0, 0, 0, 1, 0, 0],
    [1, 0, 0, 1, 1, 1, 0],
    [1, 0, 1, 0, 0, 1, 0],
    [0, 1, 1, 0, 0, 0, 1],
    [0, 0, 1, 1, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0],
]

// 그래프 - 인접리스트
let graphList: [[Int]] = [
    [1, 2, 3],
    [0, 4],
    [0, 3, 4, 5],
    [0, 2, 5],
    [1, 2, 6],
    [2, 3],
    [4],
]

var visited: [Bool] = []

// BFS - 인접행렬
func BFS_table(x: Int) {
    var queue: Queue<Int> = Queue()
    visited[x] = true

    queue.enqueue(x)

    while !queue.isEmpty {
        let now: Int = queue.dequeue()!
        print(now)

        for i in 0 ..< graphTable.count {
            if graphTable[now][i] == 1 && !visited[i] {
                visited[i] = true
                queue.enqueue(i)
            }
        }
    }
}

// BFS - 인접리스트
func BFS_list(x: Int) {
    var queue: Queue<Int> = Queue()
    visited[x] = true

    queue.enqueue(x)

    while !queue.isEmpty {
        let now: Int = queue.dequeue()!
        print(now)

        for i in 0 ..< graphList[now].count {
            let next: Int = graphList[now][i]

            if !visited[next] {
                visited[next] = true
                queue.enqueue(next)
            }
        }
    }
}