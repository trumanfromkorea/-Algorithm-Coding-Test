import Foundation

var board: [[Int]] = []
var empty: [Point] = []

var answer: String = ""

for _ in 0 ..< 9 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(line)
}

for i in 0 ..< 9 {
    for j in 0 ..< 9 {
        if board[i][j] == 0 {
            empty.append(Point(i: i, j: j))
        }
    }
}

DFS(0)

// MARK: - 선언부

struct Point {
    var i: Int
    var j: Int
}

func searchRow(_ i: Int, _ num: Int) -> Bool {
    for k in 0 ..< 9 {
        if num == board[i][k] {
            return false
        }
    }
    return true
}

func searchColumn(_ j: Int, _ num: Int) -> Bool {
    for k in 0 ..< 9 {
        if num == board[k][j] {
            return false
        }
    }
    return true
}

func searchBox(_ i: Int, _ j: Int, _ num: Int) -> Bool {
    let n = Int(i / 3) * 3
    let m = Int(j / 3) * 3

    for k in n ..< n + 3 {
        for l in m ..< m + 3 {
            if board[k][l] == num {
                return false
            }
        }
    }

    return true
}

func DFS(_ index: Int) {
    if index == empty.count {
        printAnswer()
        exit(0)
    }

    for num in 1 ... 9 {
        let i = empty[index].i
        let j = empty[index].j

        if searchRow(i, num) && searchColumn(j, num) && searchBox(i, j, num) {
            board[i][j] = num
            DFS(index + 1)
            board[i][j] = 0
        }
    }
}

func printAnswer() {
    for line in board {
        for item in line {
            answer += "\(item) "
        }
        answer += "\n"
    }

    print(answer)
}
