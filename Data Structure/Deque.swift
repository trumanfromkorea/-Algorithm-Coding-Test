
// 덱 자료구조 (양방향 큐)
struct Deque<T> {
    var leftBox: [T] = []
    var rightBox: [T] = []

    var isEmpty: Bool {
        return leftBox.isEmpty && rightBox.isEmpty
    }

    var count: Int {
        return leftBox.count + rightBox.count
    }

    mutating func appendFirst(_ input: T) {
        leftBox.append(input)
    }

    mutating func appendLast(_ input: T) {
        rightBox.append(input)
    }
    
    @discardableResult
    mutating func popFirst() -> T? {
        if leftBox.isEmpty {
            leftBox = rightBox.reversed()
            rightBox.removeAll()
        }

        return leftBox.popLast()
    }

    @discardableResult
    mutating func popLast() -> T? {
        if rightBox.isEmpty {
            rightBox = leftBox.reversed()
            leftBox.removeAll()
        }

        return rightBox.popLast()
    }

    func printDeque() {
        var output = ""

        for l in leftBox.reversed() {
            output += "\(l) "
        }

        for r in rightBox {
            output += "\(r) "
        }

        print(output)
    }
}
