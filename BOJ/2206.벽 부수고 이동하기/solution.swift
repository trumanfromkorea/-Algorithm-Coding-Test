import Foundation

// MARK: - 실행

let nums = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (nums[0], nums[1])

var board: [[Int]] = []

var wallBlock: [Point] = []
var visited: [[[Bool]]] = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)

let di = [1, -1, 0, 0]
let dj = [0, 0, 1, -1]

for _ in 0 ..< n {
    let input = readLine()!
    let line = input.map { Int(String($0))! }

    board.append(line)
}

findWall()

if n == 1 && m == 1 {
    print(1)
} else {
    solution()
}


// MARK: - 선언

struct Point {
    var i: Int
    var j: Int
    var distance: Int
    var bullet: Bool
}

func findWall() {
    for i in 0 ..< n {
        for j in 0 ..< m {
            if board[i][j] == 1 {
                wallBlock.append(Point(i: i, j: j, distance: -1, bullet: true))
            }
        }
    }
}

func solution() {
    print(BFS())
}

func BFS() -> Int {
    var queue = DoubleStackQueue<Point>()

    queue.enqueue(Point(i: 0, j: 0, distance: 1, bullet: true))
    visited[0][0][0] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for i in 0 ..< 4 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if ni == n - 1 && nj == m - 1 {
                return now.distance + 1
            }

            if !isInBound(ni, nj) {
                continue
            } else if now.bullet && visited[ni][nj][1] {
                continue
            } else if !now.bullet && visited[ni][nj][0] {
                continue
            }

            if board[ni][nj] == 0 {
                queue.enqueue(Point(i: ni, j: nj, distance: now.distance + 1, bullet: now.bullet))
                if now.bullet {
                    visited[ni][nj][1] = true
                } else {
                    visited[ni][nj][0] = true
                }
            } else if board[ni][nj] == 1 && now.bullet {
                queue.enqueue(Point(i: ni, j: nj, distance: now.distance + 1, bullet: false))
                visited[ni][nj][1] = true
            }
        }
    }

    return -1
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return n > i && i >= 0 && m > j && j >= 0
}
