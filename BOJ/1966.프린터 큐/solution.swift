import Foundation

let n: Int = Int(readLine()!)!
var answer = ""

for _ in 0 ..< n {
    var queue = DoubleStackQueue<Item>()

    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let find = input[1]

    readLine()!.split(separator: " ").enumerated().forEach { i, val in
        queue.enqueue(Item(priority: Int(val)!, index: i))
    }

    var count = 0
    var max = queue.maxValue?.priority

    while !queue.isEmpty {
        let now = queue.dequeue()!

        if now.priority == max {
            count += 1

            if now.index == find {
                answer += "\(count)\n"
                break
            }

            max = queue.maxValue?.priority
        } else {
            queue.enqueue(now)
        }
    }
}

print(answer)

struct Item: Comparable {
    static func < (lhs: Item, rhs: Item) -> Bool {
        return lhs.priority < rhs.priority
    }

    var priority: Int
    var index: Int
}

struct DoubleStackQueue<T: Comparable> {
    var inbox: [T] = []
    var outbox: [T] = []

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    var maxValue: T? {
        if self.isEmpty {
            return nil
        } else if inbox.isEmpty {
            return outbox.max()!
        } else if outbox.isEmpty {
            return inbox.max()!
        } else {
            return max(inbox.max()!, outbox.max()!)
        }
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
