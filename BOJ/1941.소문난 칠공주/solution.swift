import Foundation

/*
 모든 조합 넣고,
 BFS 로 인접하지 않은 경우 제거
 */

// MARK: - 호출

let n: Int = 5
let di: [Int] = [1, -1, 0, 0]
let dj: [Int] = [0, 0, 1, -1]

var board: [[String]] = []
var indexes: [Student] = []

var temp: [Student] = []
var answer: Int = 0

solution()

// MARK: - 선언

struct Student {
    var i: Int
    var j: Int
    var isDasom: Bool
}

func solution() {
    for i in 0 ..< n {
        let line = readLine()!.map { String($0) }
        board.append(line)

        for j in 0 ..< n {
            let isDasom = board[i][j] == "S"
            indexes.append(Student(i: i, j: j, isDasom: isDasom))
        }
    }

    combinations(0)
    
    print(answer)
}

func combinations(_ index: Int) {
    if temp.count == 7 {
        if countDasom(temp) && BFS(temp) {
            answer += 1
        }

        return
    }

    for i in index ..< indexes.count {
        temp.append(indexes[i])
        combinations(i + 1)
        temp.removeLast()
    }
}

func countDasom(_ array: [Student]) -> Bool {
    var count = 0
    for item in array {
        if item.isDasom {
            count += 1
        }
    }

    return count >= 4
}

func BFS(_ array: [Student]) -> Bool {
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: n), count: n)
    var queue: DoubleStackQueue = DoubleStackQueue<Student>()

    queue.enqueue(array[0])
    visited[array[0].i][array[0].j] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for i in 0 ..< 4 {
            let ni = now.i + di[i]
            let nj = now.j + dj[i]

            if !isInBound(ni, nj) || visited[ni][nj] {
                continue
            } else if !array.contains(
                where: { $0.i == ni && $0.j == nj && $0.isDasom == (board[ni][nj] == "S") }
            ) {
                continue
            }
            
            queue.enqueue(Student(i: ni, j: nj, isDasom: board[ni][nj] == "S"))
            visited[ni][nj] = true
        }
    }
    
    return isConnected(visited)
}

func isConnected(_ visited: [[Bool]]) -> Bool {
    var count = 0
    
    for line in visited {
        for item in line {
            if item {
                count += 1
            }
        }
    }
    
    return count == 7
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < n
}
