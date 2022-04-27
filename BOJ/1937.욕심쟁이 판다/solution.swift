import Foundation

let n: Int = Int(readLine()!)!

var answer: Int = 0
var forest: [[Int]] = []
var DP: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

let di = [1, -1, 0, 0]
let dj = [0, 0, 1, -1]

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    forest.append(line)
}

for i in 0 ..< n {
    for j in 0 ..< n {
        answer = max(answer, DFS(i, j))
    }
}

print(answer)

// MARK: 선언

func DFS(_ i: Int, _ j: Int) -> Int {
    if DP[i][j] != 0 {
        return DP[i][j]
    }

    DP[i][j] = 1

    for k in 0 ..< 4 {
        let ni = i + di[k]
        let nj = j + dj[k]

        if !isInBound(ni, nj) {
            continue
        }

        if forest[i][j] < forest[ni][nj] {
            DP[i][j] = max(DP[i][j], DFS(ni, nj) + 1)
        }
    }

    return DP[i][j]
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}
