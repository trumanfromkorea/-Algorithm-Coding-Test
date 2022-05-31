import Foundation

let size = readLine()!.split(separator: " ").map { Int(String($0))! }
let (m, n) = (size[0], size[1])

var board = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
var points = [Int]()
var start = 0

let sum = (n + m) * 2

var i = 0
var j = 0
var index = 0

var answer = 0

let pointCount = Int(readLine()!)!

for _ in 0 ..< pointCount {
    getInput(1)
}

getInput(2)

while index < sum {

    if board[i][j] == 1 {
        points.append(index)
    } else if board[i][j] == 2 {
        start = index
    }

    index += 1

    if i == 0 && j < m {
        j += 1
    } else if i < n && j == m {
        i += 1
    } else if i == n && j > 0 {
        j -= 1
    } else if i > 0 && j == 0 {
        i -= 1
    }
}

for point in points {
    let sub = abs(start - point)

    answer += min(sub, sum - sub)
}

print(answer)

// MARK: - 선언

func getInput(_ type: Int) {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (side, position) = (input[0], input[1])

    switch side {
    case 1:
        board[0][position] = type
        break
    case 2:
        board[n][position] = type
        break
    case 3:
        board[position][0] = type
        break
    case 4:
        board[position][m] = type
        break
    default:
        break
    }
}
