import Foundation

struct Point {
    let i: Int
    let j: Int
}

func solution(_ rows: Int, _ columns: Int, _ queries: [[Int]]) -> [Int] {
    var board = makeBoard(n: rows, m: columns)
    var answers: [Int] = []

    for i in 0 ..< queries.count {
        let start = Point(i: queries[i][0] - 1, j: queries[i][1] - 1)
        let end = Point(i: queries[i][2] - 1, j: queries[i][3] - 1)

        let (values, points, minValue) = getEntities(start: start, end: end, board: board)

        answers.append(minValue)
        board = fillBoard(values: values, points: points, board: board)
    }

    return answers
}

func makeBoard(n: Int, m: Int) -> [[Int]] {
    var board = Array(repeating: Array(repeating: 0, count: m), count: n)
    var value = 1

    for i in 0 ..< n {
        for j in 0 ..< m {
            board[i][j] = value
            value += 1
        }
    }

    return board
}

func getEntities(start: Point, end: Point, board: [[Int]]) -> (values: [Int], points: [Point], minValue: Int) {
    var minValue = Int.max
    var values: [Int] = []
    var points: [Point] = []

    var direction = true
    var delta = 1

    var i = start.i
    var j = start.j

    let count = 2 * (end.i - start.i + end.j - start.j)

    while values.count < count {
        minValue = min(minValue, board[i][j])
        values.append(board[i][j])
        points.append(Point(i: i, j: j))

        if direction {
            j += delta

            if j == end.j {
                direction = false
                delta = 1
            } else if j == start.j {
                direction = false
                delta = -1
            }
        } else {
            i += delta

            if i == end.i {
                direction = true
                delta = -1
            } else if i == start.i {
                direction = true
                delta = 1
            }
        }
    }

    return (values, points, minValue)
}

func fillBoard(values: [Int], points: [Point], board: [[Int]]) -> [[Int]] {
    var board = board
    var values = values

    let last = values.removeLast()
    values.insert(last, at: 0)

    for i in 0 ..< values.count {
        let value = values[i]
        let point = points[i]

        board[point.i][point.j] = value
    }

    return board
}
