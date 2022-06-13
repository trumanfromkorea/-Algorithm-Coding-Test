import Foundation

struct Point {
    var index: Int
    var weight: Int
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph = Array(repeating: [Point](), count: n+1)

for _ in 0 ..< m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[line[0]].append(Point(index: line[1], weight: line[2]))
    graph[line[1]].append(Point(index: line[0], weight: line[2]))
}

for i in 1 ... n {
    graph[i].sort { $0.weight > $1.weight }
}

let info = readLine()!.split(separator: " ").map { Int(String($0))! }
let (start, end) = (info[0], info[1])

var (minVal, maxVal) = (Int.min, 1_000_000_000)

while minVal <= maxVal {
    let mid = (minVal + maxVal) / 2
    
    if BFS(mid) {
        minVal = mid + 1
    } else {
        maxVal = mid - 1
    }
}

print(maxVal)

func BFS(_ mid: Int) -> Bool {
    var visited = Array(repeating: false, count: n + 1)
    var queue = DoubleStackQueue<Int>()
    
    visited[start] = true
    queue.enqueue(start)
    
    while !queue.isEmpty {
        let now = queue.dequeue()!
        
        if now == end {
            return true
        }
        
        for item in graph[now] {
            if !visited[item.index] && mid <= item.weight {
                queue.enqueue(item.index)
                visited[item.index] = true
            }
        }
    }
    return false
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
