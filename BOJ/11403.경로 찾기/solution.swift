import Foundation

let n = Int(readLine()!)!

var board: [[Int]] = []
var result: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
var answer = ""

for _ in 0 ..< n {
    let array = readLine()!
        .split(separator: " ")
        .map { Int(String($0))! }

    board.append(array)
}

func dfs(start: Int, now: Int, visited: inout [Bool]) {
    for i in 0 ..< board[now].count {
        if !visited[i] && board[now][i] == 1 {
            result[start][i] = true
            visited[i] = true
            dfs(start: start, now: i, visited: &visited)
        }
    }
}

for i in 0 ..< n {
    var visited = Array(repeating: false, count: n)
    dfs(start: i, now: i, visited: &visited)
}

for i in 0 ..< n {
    for j in 0 ..< n {
        answer += result[i][j] ? "1 " : "0 "
    }
    answer += "\n"
}

print(answer)
