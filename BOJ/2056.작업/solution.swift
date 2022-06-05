import Foundation

let n = Int(readLine()!)!

var preBuild = Array(repeating: [Int](), count: n + 1)
var line = Array(repeating: 0, count: n + 1)
var DP = Array(repeating: 0, count: n + 1)
var times = Array(repeating: 0, count: n + 1)

for i in 1 ... n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    times[i] = input[0]

    for j in 0 ..< input[1] {
        line[i] += 1
        preBuild[input[j + 2]].append(i)
    }
}

var queue = DoubleStackQueue<Int>()

for i in 1 ... n {
    if line[i] == 0 {
        queue.enqueue(i)
    }

    DP[i] += times[i]
}

var index = 0

while !queue.isEmpty {
    let now = queue.dequeue()!

    for i in 0 ..< preBuild[now].count {
        let next = preBuild[now][i]

        DP[next] = max(DP[next], DP[now] + times[next])

        line[next] -= 1

        if line[next] == 0 {
            queue.enqueue(next)
        }
    }
    index += 1
}

print(DP.max()!)

struct DoubleStackQueue<T> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
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
}
