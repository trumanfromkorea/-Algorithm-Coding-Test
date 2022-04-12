import Foundation

// MARK: - 실행

let nums = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (nums[0], nums[1])

var initBoard: [[Int]] = []
var board: [[Int]] = []

var emptyBlock: [Point] = []
var virusBlock: [Point] = []

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: m), count: n)

let di = [1, -1, 0, 0]
let dj = [0, 0, 1, -1]

var (a, b, c) = (0, 0, 0)
var answer = 0

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    board.append(line)
    initBoard.append(line)
}

findEmptyBlock()
solution()

print(answer)

// MARK: - 선언

struct Point {
    var i: Int
    var j: Int
}

func findEmptyBlock() {
    for i in 0 ..< n {
        for j in 0 ..< m {
            if board[i][j] == 0 {
                emptyBlock.append(Point(i: i, j: j))
            } else if board[i][j] == 2 {
                virusBlock.append(Point(i: i, j: j))
            }
        }
    }
}

func BFS(_ start: Point) {
    var queue = DoubleStackQueue<Point>()

    visited[start.i][start.j] = true
    queue.enqueue(start)

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for i in 0 ..< 4 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if !isInBound(ni, nj) || visited[ni][nj] || board[ni][nj] == 1 {
                continue
            }

            queue.enqueue(Point(i: ni, j: nj))
            board[ni][nj] = 2
            visited[ni][nj] = true
        }
    }
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return n > i && i >= 0 && m > j && j >= 0
}

func findSafeArea() {
    var count = 0

    for line in board {
        for item in line {
            if item == 0 {
                count += 1
            }
        }
    }

    answer = max(answer, count)
}

func solution() {
    while a < emptyBlock.count - 2 {
        let emptyA = emptyBlock[a]
        b = a + 1

        while b < emptyBlock.count - 1 {
            let emptyB = emptyBlock[b]
            c = b + 1
            while c < emptyBlock.count {
                let emptyC = emptyBlock[c]

                board[emptyA.i][emptyA.j] = 1
                board[emptyB.i][emptyB.j] = 1
                board[emptyC.i][emptyC.j] = 1

                visited = Array(repeating: Array(repeating: false, count: m), count: n)
                for virus in virusBlock {
                    BFS(virus)
                }

                findSafeArea()

                board = initBoard
                c += 1
            }
            b += 1
        }
        a += 1
    }
}

// 스택 두개로 구현한 큐
struct DoubleStackQueue<T> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    var count: Int {
        return inbox.count + outbox.count
    }

    var front: T? {
        return outbox.last ?? inbox.first
    }

    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }

    mutating func clear() {
        outbox.removeAll()
        inbox.removeAll()
    }

    func printQueue() {
        var output = ""

        if isEmpty {
            print("Queue is Empty")
            return
        }

        for o in outbox.reversed() {
            output += "\(o) "
        }

        for i in inbox {
            output += "\(i) "
        }

        print(output)
    }
}
