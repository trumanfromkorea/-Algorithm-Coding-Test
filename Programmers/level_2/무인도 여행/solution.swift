import Foundation

struct Node {
    let i: Int
    let j: Int
}

func solution(_ lines: [String]) -> [Int] {
    var answer: [Int] = []

    let board = lines.map {
        $0.map { Int(String($0)) ?? 0 }
    }

    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)

    for i in 0 ..< board.count {
        for j in 0 ..< board[i].count {
            if visited[i][j] || board[i][j] == 0 {
                continue
            }
            
            let result = bfs(start: Node(i: i, j: j), board: board, visited: &visited)
            if result > 0 {
                answer.append(result)
            }
        }
    }

    return answer.isEmpty ? [-1] : answer.sorted()
}

func bfs(start: Node, board: [[Int]], visited: inout [[Bool]]) -> Int {
    let deltaI = [1, -1, 0, 0]
    let deltaJ = [0, 0, 1, -1]

    var queue: [Node] = []
    var pointer = 0

    var sum = board[start.i][start.j]

    visited[start.i][start.j] = true
    queue.append(start)

    while pointer < queue.count {
        let now = queue[pointer]
        pointer += 1

        for k in 0 ..< 4 {
            let nextI = now.i + deltaI[k]
            let nextJ = now.j + deltaJ[k]

            if !isInRange(i: nextI, j: nextJ, n: board.count, m: board[0].count)
                || visited[nextI][nextJ] {
                continue
            }

            visited[nextI][nextJ] = true

            if board[nextI][nextJ] > 0 {
                sum += board[nextI][nextJ]
                queue.append(Node(i: nextI, j: nextJ))
            }
        }
    }

    return sum
}

func isInRange(i: Int, j: Int, n: Int, m: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}
