import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var board: [[Int]] = []


for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { -Int($0)! }
    board.append(line)
}

for i in 0 ..< n {
    for j in 0 ..< m {
        if board[i][j] == 0 {
            bfs(from: Point(i: i, j: j, distance: 0))
        }
    }
}

print(findMax(board))


class DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    func enqueue(_ input: T) {
        inbox.append(input)
    }

    @discardableResult
    func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }

    func clear() {
        outbox.removeAll()
        inbox.removeAll()
    }
}

struct Point {
    var i: Int
    var j: Int
    var distance: Int
}

func bfs(from start: Point) {
    let di = [0, 1, 1, 1, 0, -1, -1, -1]
    let dj = [1, 1, 0, -1, -1, -1, 0, 1]
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)

    let queue = DoubleStackQueue<Point>()
    queue.enqueue(start)
    visited[start.i][start.j] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for i in 0 ..< 8 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if !isInRange(i: ni, j: nj) || visited[ni][nj] {
                continue
            }

            if board[ni][nj] == -1 {
                board[start.i][start.j] = now.distance + 1
                return
            }

            let newPoint = Point(i: ni, j: nj, distance: now.distance + 1)
            visited[ni][nj] = true
            queue.enqueue(newPoint)
        }
    }
}

func isInRange(i: Int, j: Int) -> Bool {
    return (0 ..< n).contains(i) && (0 ..< m).contains(j)
}

func containsZero(_ board: [[Int]]) -> Bool {
    for line in board {
        if line.contains(0) { return true }
    }
    return false
}

func findMax(_ board: [[Int]]) -> Int {
    var result = 0

    for line in board {
        result = max(result, line.max()!)
    }

    return result
}

