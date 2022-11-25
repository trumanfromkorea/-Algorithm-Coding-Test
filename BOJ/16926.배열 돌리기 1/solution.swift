import Foundation

struct Point {
    var i: Int
    var j: Int
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, r) = (input[0], input[1], input[2])

var board: [[Int]] = []
var answer: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

var queueSet: [[Int]] = []
var queueIndexSet: [[Point]] = []

for _ in 0 ..< n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    board.append(line)
}

let minVal = min(n, m)

var i = 0
var j = 0

var startI = i
var startJ = j

var limitI = n
var limitJ = m

var tempN = limitI - startI
var tempM = limitJ - startJ

var delta = 1
var direction = true

while startI < minVal / 2 && startJ < minVal / 2 {
    var queueIndex: [Point] = []
    var queue: [Int] = []

    i = startI
    j = startJ

    while queue.count < 2 * (tempN + tempM - 2) {
        queueIndex.append(Point(i: i, j: j))
        queue.append(board[i][j])

        if direction {
            j += delta

            if j == limitJ - 1 {
                direction = false
                delta = 1
            } else if j == startJ {
                direction = false
                delta = -1
            }
        } else {
            i += delta

            if i == limitI - 1 {
                direction = true
                delta = -1
            } else if i == startI {
                direction = true
                delta = 1
            }
        }
    }

    queueIndexSet.append(queueIndex)
    queueSet.append(queue)

    startI += 1
    startJ += 1

    limitI -= 1
    limitJ -= 1

    tempN = limitI - startI
    tempM = limitJ - startJ
}

for i in 0 ..< queueSet.count {
    var rotate = r

    let queue = queueSet[i]

    for pointIndex in 0 ..< queueIndexSet[i].count {
        let point = queueIndexSet[i][pointIndex]

        answer[point.i][point.j] = queue[rotate % queue.count]
        rotate += 1
    }
}

for i in 0 ..< answer.count {
    let output = answer[i].map { String($0) }.joined(separator: " ")
    print(output)
}
