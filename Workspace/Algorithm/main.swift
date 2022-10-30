// 파스칼의 삼각형
//
// 1
// 1 1
// 1 2 1
// 1 3 3 1
// 1 4 6 4 1
// ...

import Foundation

let input = Int(readLine()!)!
var answer = ""

var pascal = Array(repeating: Array(repeating: 0, count: 31), count: 31)

pascal[0][0] = 1

for i in 1 ... 30 {
    for j in 0 ... 30 {
        if j == 0 {
            pascal[i][j] = 1
            continue
        }
        pascal[i][j] = pascal[i - 1][j] + pascal[i - 1][j - 1]
    }
}

for _ in 0 ..< input {
    let line = readLine()!.split(separator: " ").map { Int($0)! }

    let (n, m) = (line[0], line[1])

    answer += "\(pascal[m][n])\n"
}

print(answer)
