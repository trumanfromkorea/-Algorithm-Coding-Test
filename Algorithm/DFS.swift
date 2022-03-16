// DFS

import Foudation

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
