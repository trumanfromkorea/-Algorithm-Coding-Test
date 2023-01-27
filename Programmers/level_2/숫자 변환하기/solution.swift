import Foundation

enum Operation {
    case add(_ operand: Int)
    case multiple(_ operand: Int)

    func calculate(to value: Int) -> Int {
        switch self {
        case let .add(operand):
            return value + operand
        case let .multiple(operand):
            return value * operand
        }
    }
}

struct Node {
    var value: Int
    var count: Int
}

// BFS
func solution(_ start: Int, _ target: Int, _ n: Int) -> Int {
    if start == target { return 0 }

    let operations: [Operation] = [.add(n), .multiple(2), .multiple(3)]

    var visited = Set<Int>()
    var queue: [Node] = []
    var pointer = 0

    queue.append(Node(value: start, count: 0))
    visited.insert(start)

    while pointer < queue.count {
        let now = queue[pointer]
        pointer += 1

        if now.value > target {
            continue
        }

        for i in 0 ..< operations.count {
            let operation = operations[i]
            let result = operation.calculate(to: now.value)

            if result == target {
                return now.count + 1
            }

            if !visited.contains(result) {
                queue.append(Node(value: result, count: now.count + 1))
                visited.insert(result)
            }
        }
    }

    return -1
}
