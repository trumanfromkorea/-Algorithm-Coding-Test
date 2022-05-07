
import Foundation

struct Option {
    var op: String
    var count: Int
}

func solution(_ rc: [[Int]], _ operations: [String]) -> [[Int]] {
    if hasOnlyValue(rc) { return rc }

    let n = rc.count
    let m = rc[0].count

    let R = (m * 2) + 2 * (n - 2)

    var board = rc
    var shiftCount = 0
    var rotateCount = 0

    var archived: [Option] = []

    for operation in operations {
        if operation == "ShiftRow" {
            if rotateCount > 0 {
                archived.append(Option(op: "Rotate", count: rotateCount))
                rotateCount = 0
            }
            shiftCount += 1
        } else {
            if shiftCount > 0 {
                archived.append(Option(op: "ShiftRow", count: shiftCount))
                shiftCount = 0
            }
            rotateCount += 1
        }
    }

    if shiftCount > 0 {
        archived.append(Option(op: "ShiftRow", count: shiftCount))
    }
    if rotateCount > 0 {
        archived.append(Option(op: "Rotate", count: rotateCount))
    }

    for option in archived {
        if option.op == "ShiftRow" {
            if duplicateRow(board) {
                continue
            }
            let sliceIndex = option.count % n
            let sliced = board[n - sliceIndex ..< n]
            let restof = board[0 ..< n - sliceIndex]
            
            board = Array(sliced) + Array(restof)
        } else {
            findStart(&board, option.count%R, rotateList(board))

        }
    }

    return board
}

func duplicateRow(_ board: [[Int]]) -> Bool {
    for line in board {
        if line != board[0] {
            return false
        }
    }
    return true
}

func hasOnlyValue(_ board: [[Int]]) -> Bool {
    let val = board[0][0]

    for line in board {
        for item in line {
            if item != val {
                return false
            }
        }
    }

    return true
}

func rotateList(_ board: [[Int]]) -> [Int] {
    var rotatelist: [Int] = []
    var ri = 0
    var rj = 1

    var value = board[0][0]

    let direction = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var di = 0

    while !(ri == 0 && rj == 0) {
        rotatelist.append(value)
        
        var newi = ri + direction[di % 4][0]
        var newj = rj + direction[di % 4][1]

        if !isInBound(newi, newj, board) {
            di += 1
            newi = ri + direction[di % 4][0]
            newj = rj + direction[di % 4][1]
        }

        let temp = board[ri][rj]

//        board[ri][rj] = value
        value = temp

        ri = newi
        rj = newj
    }

    rotatelist.append(value)
    
    return rotatelist
}

func findStart(_ board: inout [[Int]], _ count: Int, _ list: [Int]) {
    
    var ri = 0
    var rj = 0
    
    let direction = [[0, 1], [1, 0], [0, -1], [-1, 0]]
    var di = 0
    
    for _ in 0 ..< count {
        var newi = ri + direction[di % 4][0]
        var newj = rj + direction[di % 4][1]

        if !isInBound(newi, newj, board) {
            di += 1
            newi = ri + direction[di % 4][0]
            newj = rj + direction[di % 4][1]
        }
        ri = newi
        rj = newj
    }
    
    
    for item in list {
        var newi = ri + direction[di % 4][0]
        var newj = rj + direction[di % 4][1]

        if !isInBound(newi, newj, board) {
            di += 1
            newi = ri + direction[di % 4][0]
            newj = rj + direction[di % 4][1]
        }

        board[ri][rj] = item

        ri = newi
        rj = newj
    }
    
}

func isInBound(_ i: Int, _ j: Int, _ board: [[Int]]) -> Bool {
    let n = board.count
    let m = board[0].count

    return 0 <= i && i < n && 0 <= j && j < m
}
