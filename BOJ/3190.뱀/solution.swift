import Foundation

// 입력 시작
let n: Int = Int(readLine()!)!

var board = Array(repeating: Array(repeating: 0, count: n), count: n)

let appleCount: Int = Int(readLine()!)!

for _ in 0 ..< appleCount {
    let input = readLine()!.split(separator: " ").map { Int($0)! }

    board[input[0] - 1][input[1] - 1] = 1
}

let directionCount: Int = Int(readLine()!)!
var directions: [Direction] = []

for _ in 0 ..< directionCount {
    let input = readLine()!.split(separator: " ").map { String($0) }

    directions.append(Direction(block: Int(input[0])!, direction: input[1]))
}

// 입력 끝

var snake: [Point] = [Point(i: 0, j: 0)]
var (si, sj, d) = (0, 0, 0)

var delta = [[0, 1], [1, 0], [0, -1], [-1, 0]]

var change: Direction? = directions.removeFirst()
var count = 0

solution()

// MARK: - 선언

struct Direction {
    var block: Int
    var direction: String
}

struct Point {
    var i: Int
    var j: Int
}

func solution() {
    while isInBound() {
        if change != nil && change!.block == count {
            if change!.direction == "D" {
                d += 1
            } else {
                d -= 1
                if d < 0 {
                    d += 4
                }
            }

            if directions.isEmpty {
                change = nil
            } else {
                change = directions.removeFirst()
            }
        }

        si += delta[d % 4][0]
        sj += delta[d % 4][1]

        if snake.contains(where: { $0.i == si && $0.j == sj }) {
            break
        } else if !isInBound() {
            break
        }

        if board[si][sj] == 0 {
            snake.insert(Point(i: si, j: sj), at: 0)
            snake.removeLast()
        } else {
            snake.insert(Point(i: si, j: sj), at: 0)
            board[si][sj] = 0
        }

        count += 1
    }

    print(count + 1)
}

func isInBound() -> Bool {
    return 0 <= si && si < n && 0 <= sj && sj < n
}
