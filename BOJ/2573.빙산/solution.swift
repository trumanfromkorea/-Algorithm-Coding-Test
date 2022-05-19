import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var board = [[Int]]()
var ices = [Point]()
var melted = [Point]()
var count = 0

var checkDivided = Array(repeating: Array(repeating: false, count: m), count: n)

let di = [-1, 0, 1, 0]
let dj = [0, -1, 0, 1]

for i in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)

    for j in 0 ..< m {
        if board[i][j] > 0 {
            let newIce = Point(i: i, j: j, size: board[i][j])
            ices.append(newIce)
        }
    }
}

solution()

func solution() {
    while !isAllEmpty() {
        checkDivided = Array(repeating: Array(repeating: false, count: m), count: n)
        melt()
        count += 1
        
        ices = melted
        board = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        for item in melted {
            board[item.i][item.j] = item.size
        }
        
        if ices.isEmpty {
            print(0)
            return
        }
        
        
        divided()
        
        for item in ices {
            
            if !checkDivided[item.i][item.j] {
                print(count)
                return
            }
        }
    }
    
    print(0)
}



// MARK: - 선언

func divided() {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = DoubleStackQueue<Point>()

    let start = ices[0]
    
    queue.enqueue(start)
    visited[start.i][start.j] = true
    checkDivided[start.i][start.j] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for i in 0 ..< 4 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if !isInBound(ni, nj) || visited[ni][nj] || board[ni][nj] == 0 {
                continue
            }

            queue.enqueue(Point(i: ni, j: nj, size: board[ni][nj]))
            visited[ni][nj] = true
            checkDivided[ni][nj] = true
        }
    }
}

func isAllEmpty() -> Bool {
    for line in board {
        for item in line {
            if item != 0 {
                return false
            }
        }
    }
    return true
}

func melt() {
    melted = []

    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = DoubleStackQueue<Point>()

    let start = ices[0]

    queue.enqueue(start)
    visited[start.i][start.j] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!
        var water = 0

        for i in 0 ..< 4 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if !isInBound(ni, nj) || visited[ni][nj] {
                continue
            }

            if board[ni][nj] == 0 {
                water += 1
                continue
            }

            queue.enqueue(Point(i: ni, j: nj, size: board[ni][nj]))
            visited[ni][nj] = true
        }

        if now.size - water > 0 {
            melted.append(Point(i: now.i, j: now.j, size: now.size - water))
        }
    }
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}

struct Point {
    var i: Int
    var j: Int
    var size: Int
}

// 스택 두개로 구현한 큐
struct DoubleStackQueue<T> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
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
}
