import Foundation

// MARK: - 구현부

let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

let n = Int(readLine()!)!

var board: [[Int]] = []
var shark: Shark = Shark(i: -1, j: -1, size: 2, eat: 0, distance: 0)

for i in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }

    board.append(line)
    
    if let j = line.firstIndex(of: 9) {
        shark.i = i
        shark.j = j
        board[i][j] = 0
    }
}

while BFS(shark.i, shark.j) {}

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

func BFS(_ si: Int, _ sj: Int) -> Bool {
    // 최소는 일단 현재위치로 초기화, 거리는 최대로
    var minDist: Point = Point(i: si, j: sj, distance: .max)
    var queue: Queue = Queue<Point>()

    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)

    visited[si][sj] = true
    queue.enqueue(Point(i: si, j: sj, distance: 0))

    while !queue.isEmpty {
        let now = queue.dequeue()!
        visited[now.i][now.j] = true
        
        // 먹을 수 있는 물고기 업데이트
        compareEat(now: now, minDist: &minDist)
        
        // 확장
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
    
    // true 면 잘 먹은거, false 면 아니므로 끝
    return eatFish(point: minDist)
}

func compareEat(now: Point, minDist: inout Point) {
    // 더 가까이 있는 먹을 수 있는 물고기
    if board[now.i][now.j] < shark.size
        && board[now.i][now.j] > 0
        && now.distance < minDist.distance
    {
        minDist = now
    }
    // 먹을 수 있는 물고기가 여러마리라면
    else if board[now.i][now.j] < shark.size
        && board[now.i][now.j] > 0
        && now.distance == minDist.distance
    {
        // 가장 위에 있는 물고기
        if now.i < minDist.i {
            minDist = now
        } else if now.i == minDist.i {
            // 가장 왼쪽에 있는 물고기
            if now.j < minDist.j {
                minDist = now
            }
        }
    }
}

func eatFish(point: Point) -> Bool {
    // 먹을 수 있는 물고기라면
    if board[point.i][point.j] != 0 && board[point.i][point.j] < shark.size {
        board[point.i][point.j] = 0
        shark.eat += 1

        shark.distance += point.distance

        shark.i = point.i
        shark.j = point.j
        
        // 상어 크기 키우기
        if shark.eat == shark.size {
            shark.size += 1
            shark.eat = 0
        }
        
        return true
    }
    
    return false
}

struct Queue<T> {
    private var queue: [T] = []

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
    
    public mutating func clear() {
        queue.removeAll()
    }
}

