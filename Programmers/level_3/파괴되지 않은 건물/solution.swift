import Foundation


func solution(_ board: [[Int]], _ skills: [[Int]]) -> Int {
    let prefixSum = prefixSum(board, skills)
    let newBoard = useSkills(board, prefixSum)

    return countBuildings(newBoard)
}

func countBuildings(_ board: [[Int]]) -> Int {
    var result = 0

    for line in board {
        for item in line {
            if item > 0 {
                result += 1
            }
        }
    }

    return result
}

func useSkills(_ board: [[Int]], _ prefixSum: [[Int]]) -> [[Int]] {
    let (n, m) = (board.count, board[0].count)
    var newBoard = Array(repeating: Array(repeating: 0, count: m), count: n)

    for i in 0 ..< n {
        for j in 0 ..< m {
            newBoard[i][j] = board[i][j] + prefixSum[i][j]
        }
    }

    return newBoard
}

func prefixSum(_ board: [[Int]], _ skills: [[Int]]) -> [[Int]] {
    let (n, m) = (board.count, board[0].count)

    var prefixBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)

    for skill in skills {
        let type = skill.first!
        var degree = skill.last!

        let (si, sj) = (skill[1], skill[2])
        let (ei, ej) = (skill[3], skill[4])

        if type == 1 {
            degree *= -1
        }

        prefixBoard[si][sj] += degree
        prefixBoard[si][ej + 1] -= degree
        prefixBoard[ei + 1][sj] -= degree
        prefixBoard[ei + 1][ej + 1] += degree
    }

    for i in 0 ..< n {
        for j in 1 ..< m {
            prefixBoard[i][j] += prefixBoard[i][j - 1]
        }
    }

    for j in 0 ..< m {
        for i in 1 ..< n {
            prefixBoard[i][j] += prefixBoard[i - 1][j]
        }
    }

    return prefixBoard
}
