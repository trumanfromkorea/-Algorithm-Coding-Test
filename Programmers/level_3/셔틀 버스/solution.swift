import Foundation

func solution(_ n: Int, _ interval: Int, _ passengers: Int, _ timetable: [String]) -> String {
    var queue = DoubleStackQueue<Int>()
    var time = 540
    var last = -1
    var board = 0

    timetable.sorted().forEach { time in
        let split = time.split(separator: ":").map { Int($0)! }
        queue.enqueue(split[0] * 60 + split[1])
    }

    for _ in 0 ..< n {
        board = 0
        for _ in 0 ..< passengers {
            if !queue.isEmpty {
                if queue.front! <= time {
                    last = queue.dequeue()!
                    board += 1
                }
            }
        }

        time += interval
    }

    if last == -1 {
        return generateTime(time - interval)
    } else {
        return board == passengers ? generateTime(last - 1) : generateTime(time - interval)
    }
}

func generateTime(_ time: Int) -> String {
    var result = ""

    let hour = time / 60
    let min = time % 60

    result += hour < 10 ? "0\(hour):" : "\(hour):"
    result += min < 10 ? "0\(min)" : "\(min)"

    return result
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

}
