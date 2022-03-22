import Foundation

// MARK: - 구현부

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

let n = Int(readLine()!)!

var board: [[Int]] = []
var shark: Shark = Shark(i: -1, j: -1, size: 2, eat: 0, distance: 0)

for i in 0 ..< n {
    var line = readLine()!.split(separator: " ").map { Int(String($0))! }

    for (j, l) in line.enumerated() {
        if l == 9 {
            shark.i = i
            shark.j = j
            line[j] = 0
        }
    }

    board.append(line)
}

while !isAllBigger() {
    BFS(shark.i, shark.j)

//    print("-----------")
//    for b in board {
//        print(b)
//    }
}

print(shark.distance)

// MARK: - 선언부

struct Shark {
    var i: Int
    var j: Int
    var size: Int
    var eat: Int
    var distance: Int
}

struct Point {
    var i: Int
    var j: Int
    var distance: Int
}

func isInBound(_ x: Int, _ y: Int) -> Bool {
    return n > x && x >= 0 && n > y && y >= 0
}

func isAllBigger() -> Bool {
    for line in board {
        for item in line {
            if item != 0 && item < shark.size {
                return false
            }
        }
    }
    return true
}

func BFS(_ si: Int, _ sj: Int) {
    var minDist: Point = Point(i: -1, j: -1, distance: .max)
    var queue: Queue = Queue<Point>()

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

    visited[si][sj] = true
    queue.enqueue(Point(i: si, j: sj, distance: 0))

    while !queue.isEmpty {
        let now = queue.dequeue()!
        visited[now.i][now.j] = true

        if minDist.i == -1 {
            minDist = now
        } else {
            compareEat(now: now, minDist: &minDist)
        }

        for i in 0 ..< 4 {
            let ni = now.i + dx[i]
            let nj = now.j + dy[i]

            if !isInBound(ni, nj) || visited[ni][nj] || shark.size < board[ni][nj] {
                continue
            }

            queue.enqueue(Point(i: ni, j: nj, distance: now.distance + 1))
            visited[ni][nj] = true
        }
    }
    
    print(minDist)
    eatFish(point: minDist)
}

func compareEat(now: Point, minDist: inout Point) {
    if board[now.i][now.j] < board[minDist.i][minDist.j] {
        minDist = now
    } else if board[now.i][now.j] == board[minDist.i][minDist.j] {
        if now.i < minDist.i {
            minDist = now
        } else if now.i == minDist.i {
            if now.j < minDist.j {
                minDist = now
            }
        }
    }
}

func eatFish(point: Point) -> Bool {
    if board[point.i][point.j] != 0 && board[point.i][point.j] < shark.size {
        board[point.i][point.j] = 0
        shark.eat += 1

        shark.distance += point.distance

        shark.i = point.i
        shark.j = point.j

        if shark.eat == shark.size {
            shark.size += 1
            shark.eat = 0
        }

        return true
    }

    return false
}
