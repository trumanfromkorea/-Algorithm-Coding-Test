import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (n, m, k, x) = (input[0], input[1], input[2], input[3])

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited = Array(repeating: false, count: n + 1)
var distance = Array(repeating: Int.max, count: n + 1)
var answer = ""

solution()

// MARK: - 선언

func solution() {
    for _ in 0 ..< m {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (start, end) = (line[0], line[1])
        graph[start].append(end)
    }

    dijkstra(x)

    for i in 1 ..< distance.count {
        if distance[i] == k {
            answer += "\(i)\n"
        }
    }

    print(answer.isEmpty ? -1 : answer)
}

func dijkstra(_ start: Int) {
    var queue = DoubleStackQueue<Int>()

    queue.enqueue(start)
    visited[start] = true
    distance[start] = 0

    while !queue.isEmpty {
        let now = queue.dequeue()!

        for node in graph[now] {
            if visited[node] {
                if distance[node] > distance[now] + 1 {
                    distance[node] = distance[now] + 1
                }
            } else {
                queue.enqueue(node)
                visited[node] = true
                distance[node] = distance[now] + 1
            }
        }
    }
}

struct DoubleStackQueue<T> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
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
}
