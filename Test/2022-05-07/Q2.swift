import Foundation

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    if (sum(queue1) + sum(queue2)) % 2 == 1 { return -1 }
    if sum(queue1) == sum(queue2) { return 0 }

    var answer = 0

    var Q1 = DoubleStackQueue<Int>(queue1)
    var Q2 = DoubleStackQueue<Int>(queue2)
    
//    var set = Set<Array<Int>>()
    var qSet = Set<DoubleStackQueue<Int>>()

    var sum1 = queueSum(Q1)
    var sum2 = queueSum(Q2)

    while sum1 != sum2 {
        qSet.insert(Q1)
        qSet.insert(Q2)
        
        if sum1 > sum2 {
            while sum1 > sum2 {
                let val = Q1.dequeue()!
                Q2.enqueue(val)
                answer += 1

                sum1 -= val
                sum2 += val
            }

        } else {
            while sum1 < sum2 {
                let val = Q2.dequeue()!
                Q1.enqueue(val)
                answer += 1

                sum1 += val
                sum2 -= val
            }
        }

        if qSet.contains(Q1) || qSet.contains(Q2) {
            return -1
        }
        if Q1.isEmpty || Q2.isEmpty {
            return -1
        }
    }

    return answer
}

func sum(_ queue: [Int]) -> Int {
    return queue.reduce(0, +)
}

func queueSum(_ queue: DoubleStackQueue<Int>) -> Int {
    return queue.inbox.reduce(0, +) + queue.outbox.reduce(0, +)
}

struct DoubleStackQueue<Int: Equatable> : Hashable {
    
    static func == (lhs: DoubleStackQueue<Int>, rhs: DoubleStackQueue<Int>) -> Bool {
        return lhs.inbox == rhs.inbox && lhs.outbox == rhs.outbox
    }
    
    func hash(into hasher: inout Hasher) {}
    
    var inbox: [Int] = []
    var outbox: [Int] = []

    init(_ list: [Int]) {
        inbox = list
    }

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }

    var front: Int? {
        return outbox.last ?? inbox.first
    }

    mutating func enqueue(_ input: Int) {
        inbox.append(input)
    }

    @discardableResult
    mutating func dequeue() -> Int? {
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



