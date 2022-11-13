import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (input[0], input[1], input[2])

var answer = 0
var board = Array(repeating: Array(repeating: 0, count: m), count: n)
var visited = Array(repeating: Array(repeating: false, count: m), count: n)

let deltaI = [0, 0, 1, -1]
let deltaJ = [1, -1, 0, 0]

for _ in 0 ..< k {
    let trashInput = readLine()!.split(separator: " ").map { Int($0)! }
    let (trashI, trashJ) = (trashInput[0] - 1, trashInput[1] - 1)
    board[trashI][trashJ] = 1
}

for i in 0 ..< n {
    for j in 0 ..< m {
        if board[i][j] == 1 && !visited[i][j] {
            let size = bfs(from: Point(i: i, j: j))
            answer = max(answer, size)
        }
    }
}

print(answer)

struct Point {
    var i: Int
    var j: Int
}

func bfs(from start: Point) -> Int {
    var size = 1
    var queue: [Point] = []
    var queueIndex = 0

    queue.append(start)
    visited[start.i][start.j] = true

    while !queue.isEmpty && queueIndex < queue.count {
        let now = queue[queueIndex]
        queueIndex += 1

        for i in 0 ..< 4 {
            let nextI = now.i + deltaI[i]
            let nextJ = now.j + deltaJ[i]

            if !isInRange(nextI, nextJ)
                || visited[nextI][nextJ]
                || board[nextI][nextJ] == 0 {
                continue
            }

            queue.append(Point(i: nextI, j: nextJ))
            visited[nextI][nextJ] = true
            size += 1
        }
    }
    
    return size
}

func isInRange(_ i: Int, _ j: Int) -> Bool {
    return (0 ..< n).contains(i) && (0 ..< m).contains(j)
}
