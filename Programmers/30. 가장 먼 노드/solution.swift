import Foundation

struct Queue<T> {
    private var queue: [T] = []

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}

func solution(_ n: Int, _ edge: [[Int]]) -> Int {
    var visited: [Bool] = [Bool](repeating: false, count: n)
    var distanceList: [Int] = []

    let listGraph: [[Int]] = generateGraph(n, edge)
    BFS(n, 0, listGraph, &visited, &distanceList)

    return findMaxCount(distanceList)
}

func findMaxCount(_ distanceList: [Int]) -> Int {
    var count: Int = 0
    let max: Int = distanceList.max()!

    for d in distanceList {
        if d == max {
            count += 1
        }
    }

    return count
}

func generateGraph(_ n: Int, _ edge: [[Int]]) -> [[Int]] {
    var _listGraph: [[Int]] = [[Int]](repeating: [], count: n)

    for e in edge {
        let i: Int = e[0] - 1
        let j: Int = e[1] - 1

        _listGraph[i].append(j)
        _listGraph[j].append(i)
    }

    return _listGraph
}

func BFS(_ n: Int, _ x: Int, _ listGraph: [[Int]], _ visited: inout [Bool], _ distanceList: inout [Int]) {
    var queue: Queue = Queue<Int>()
    var distQueue: Queue = Queue<Int>()

    visited[x] = true

    queue.enqueue(x)
    distQueue.enqueue(0)

    while !queue.isEmpty {
        let now: Int = queue.dequeue()!
        let dist: Int = distQueue.dequeue()!

        distanceList.append(dist)

        for i in 0 ..< listGraph[now].count {
            let next: Int = listGraph[now][i]

            if !visited[next] {
                visited[next] = true
                queue.enqueue(next)
                distQueue.enqueue(dist + 1)
            }
        }
    }
}
