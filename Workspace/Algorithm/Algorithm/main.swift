import Foundation

let n: Int = Int(readLine()!)!

var answer: Int = 0
var forest: [[Int]] = []
var DP: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

let di = [0, 0, -1, 1]
let dj = [-1, 1, 0, 0]

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    forest.append(line)
}

for i in 0 ..< n {
    for j in 0 ..< n {
        BFS(i, j)
    }
}

for line in DP {
    answer = max(answer, line.max()!)
}

print(answer + 1)

// MARK: - 선언

struct Point {
    var i: Int
    var j: Int
    var distance: Int
}

func BFS(_ i: Int, _ j: Int) {
    var queue: DoubleStackQueue = DoubleStackQueue<Point>()

    queue.enqueue(Point(i: i, j: j, distance: 0))

    while !queue.isEmpty {
        let now = queue.dequeue()!
        
        DP[i][j] = max(now.distance, DP[i][j])
        
        for line in 0 ... i {
            answer = max(answer, DP[line].max()!)
        }
        
        for k in 0 ..< 4 {
            let ni = now.i + di[k]
            let nj = now.j + dj[k]

            if !isInBound(ni, nj) {
                continue
            } else if forest[ni][nj] <= forest[now.i][now.j] {
                continue
            } else if DP[ni][nj] >= answer {
                DP[i][j] = max(DP[ni][nj] + now.distance + 1, DP[i][j])
                continue
            }

            queue.enqueue(Point(i: ni, j: nj, distance: now.distance + 1))

        }
    }
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}
