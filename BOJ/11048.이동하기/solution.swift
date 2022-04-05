import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (input[0], input[1])

var board: [[Int]] = []

var DP: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    board.append(line)
}

DP[1][1] = board[0][0]

for i in 1 ... n {
    for j in 1 ... m {
        let a = DP[i - 1][j]
        let b = DP[i][j - 1]
        let c = DP[i - 1][j - 1]

        DP[i][j] = max(a, max(b, c)) + board[i - 1][j - 1]
    }
}

print(DP[n][m])
