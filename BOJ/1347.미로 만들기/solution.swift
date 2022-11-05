import Foundation

let n = Int(readLine()!)!
let input = readLine()!.map { String($0) }

var board = Array(repeating: Array(repeating: 0, count: 101), count: 101)

var direction = 0
let di = [1, 0, -1, 0]
let dj = [0, -1, 0, 1]

var (i, j) = (50, 50)
var (minI, minJ, maxI, maxJ) = (50, 50, 50, 50)
board[50][50] = 1

for index in 0 ..< n {
    if direction < 0 {
        direction = 3
    } else if direction > 3 {
        direction = 0
    }

    if input[index] == "R" {
        direction += 1
    } else if input[index] == "L" {
        direction -= 1
    } else if input[index] == "F" {
        i += di[direction]
        j += dj[direction]

        minI = min(i, minI)
        minJ = min(j, minJ)
        maxI = max(i, maxI)
        maxJ = max(j, maxJ)
    }
    
    board[i][j] = 1
}

for ni in minI ... maxI {
    var line = ""
    for nj in minJ ... maxJ {
        line += board[ni][nj] == 1 ? "." : "#"
    }
    print(line)
}
