import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var board = Array(repeating: Array(repeating: 0, count: m), count: n)

var coinA: Point?
var coinB: Point?

let di = [1, -1, 0, 0]
let dj = [0, 0, 1, -1]

for i in 0 ..< n {
    let line = readLine()!.map { String($0) }

    for j in 0 ..< m {
        if line[j] == "#" {
            board[i][j] = 1
        } else if line[j] == "o" {
            if coinA == nil {
                coinA = Point(i: i, j: j, distance: 0)
            } else {
                coinB = Point(i: i, j: j, distance: 0)
            }
        }
    }
}

var coins = Coin(A: coinA!, B: coinB!)

BFS()

// MARK: - 선언

struct Point {
    var i: Int
    var j: Int
    var distance: Int
}

struct Coin {
    var A: Point
    var B: Point
}

func BFS() {
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var queue = DoubleStackQueue<Coin>()

    queue.enqueue(coins)

    visited[coins.A.i][coins.A.j] = true
    visited[coins.B.i][coins.B.j] = true

    while !queue.isEmpty {
        let now = queue.dequeue()!
        
        if now.A.distance >= 10 {
            print(-1)
            return
        }

        for i in 0 ..< 4 {
            let A = now.A
            let B = now.B

            let ai = A.i + di[i]
            let aj = A.j + dj[i]

            let bi = B.i + di[i]
            let bj = B.j + dj[i]

            if !isInBound(ai, aj) && !isInBound(bi, bj) {
                continue
            }

            if !isInBound(ai, aj) && isInBound(bi, bj) {
                print(A.distance + 1)
                return
            }
            if isInBound(ai, aj) && !isInBound(bi, bj) {
                print(B.distance + 1)
                return
            }

            // a 가 벽을 만났을때
            if board[ai][aj] == 1 {
                // b 도 벽을 만났을때
                if board[bi][bj] == 1 {
                    continue
                }
                // a 만 벽일때
                else {
                    queue.enqueue(
                        Coin(
                            A: Point(i: A.i, j: A.j, distance: A.distance + 1),
                            B: Point(i: bi, j: bj, distance: B.distance + 1)
                        )
                    )
                }
            } else if board[bi][bj] == 1 {
                if board[ai][aj] == 1 {
                    continue
                } else {
                    queue.enqueue(
                        Coin(
                            A: Point(i: ai, j: aj, distance: A.distance + 1),
                            B: Point(i: B.i, j: B.j, distance: B.distance + 1)
                        )
                    )
                }
            } else {
                queue.enqueue(
                    Coin(
                        A: Point(i: ai, j: aj, distance: A.distance + 1),
                        B: Point(i: bi, j: bj, distance: B.distance + 1)
                    )
                )
            }
        }
    }

    print(-1)
}

func isInBound(_ i: Int, _ j: Int) -> Bool {
    return 0 <= i && i < n && 0 <= j && j < m
}

struct DoubleStackQueue<T> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    var count: Int {
        return inbox.count + outbox.count
    }

    var front: T? {
        return outbox.last ?? inbox.first
    }

    mutating func enqueue(_ input: T) {
        inbox.append(input)
    }

    @discardableResult
    mutating func dequeue() -> T? {
        if outbox.isEmpty {
            outbox = inbox.reversed()
            inbox.removeAll()
        }
        return outbox.popLast()
    }

    mutating func clear() {
        outbox.removeAll()
        inbox.removeAll()
    }

    func printQueue() {
        var output = ""

        if isEmpty {
            print("Queue is Empty")
            return
        }

        for o in outbox.reversed() {
            output += "\(o) "
        }

        for i in inbox {
            output += "\(i) "
        }

        print(output)
    }
}
