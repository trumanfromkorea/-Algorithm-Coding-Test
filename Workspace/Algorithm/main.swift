import Foundation

func solution(_ board: [[Int]]) -> Int {
    enum Direction: Int {
        case down, up, right, left
    }

    let costs = Array(repeating: Array(repeating: Int.max, count: board.count), count: board.count)
    var dirCosts = Array(repeating: costs, count: 4)

    let xDir = [0, 0, 1, -1]
    let yDir = [1, -1, 0, 0]

    for i in 0 ..< 4 {
        dirCosts[i][0][0] = 0
    }

    func DFS(_ x: Int, _ y: Int, _ currDir: Direction) {
        let directions: [Direction] = [.down, .up, .right, .left]

        for i in 0 ..< 4 {
            let nx = x + xDir[i]
            let ny = y + yDir[i]
            let nextDir = directions[i]
            let nextCost = dirCosts[currDir.rawValue][x][y] + (currDir == nextDir ? 100 : 600)

            guard isInRange(nx, ny, board.count),
                  dirCosts[i][nx][ny] > nextCost else {
                continue
            }

            dirCosts[i][nx][ny] = nextCost

            if board[nx][ny] != 1 {
                DFS(nx, ny, nextDir)
            }
        }
    }

    DFS(0, 0, .up)
    DFS(0, 0, .left)
    DFS(0, 0, .right)
    DFS(0, 0, .down)

    let result = dirCosts.map { $0[board.count - 1][board.count - 1] }.min()!

    return result
}

func isInRange(_ x: Int, _ y: Int, _ n: Int) -> Bool {
    return x >= 0 && x < n && y >= 0 && y < n
}
