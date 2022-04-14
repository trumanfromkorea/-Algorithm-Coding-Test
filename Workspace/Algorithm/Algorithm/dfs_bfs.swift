//
//  main.swift
//  Algorithm
//
//  Created by 장재훈 on 2022/01/07.
//

import Foundation

class GraphSearch {
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

    // visited 배열 초기화
//    initialVisited()
//    DFS_table(x: 0)
//
//    initialVisited()
//    DFS_list(x: 0)
//
//    initialVisited()
//    BFS_table(x: 0)
//
//    initialVisited()
//    BFS_list(x: 0)

    // DFS - 인접행렬
    func DFS_table(x: Int) {
        visited[x] = true
        print(x)

        for i in 0 ..< graphTable.count {
            if graphTable[x][i] == 1 && visited[i] == false {
                DFS_table(x: i)
            }
        }
    }

    // DFS - 인접리스트
    func DFS_list(x: Int) {
        visited[x] = true
        print(x)

        for i in 0 ..< graphList[x].count {
            let next: Int = graphList[x][i]

            if !visited[next] {
                DFS_list(x: next)
            }
        }
    }

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

    // visited 배열 초기화
    func initialVisited() {
        visited = Array(repeating: false, count: 7)
    }
}



