
// 스택 두개로 구현한 큐
struct DoubleStackQueue<T> {
    private var inbox: [T] = []
    private var outbox: [T] = []

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
