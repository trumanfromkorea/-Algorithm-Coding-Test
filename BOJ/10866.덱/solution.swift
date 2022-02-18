
import Foundation

struct Deque<T> {
    private var deque: [T] = []

    func getSize() {
        print(deque.count)
    }

    func isEmpty() {
        print(deque.isEmpty ? 1 : 0)
    }

    func getFront() {
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.first!)
        }
    }

    func getBack() {
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.last!)
        }
    }

    mutating func pushFront(_ input: T) {
        deque.insert(input, at: 0)
    }

    mutating func pushBack(_ input: T) {
        deque.append(input)
    }

    mutating func popFront() {
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.removeFirst())
        }
    }

    mutating func popBack() {
        if deque.isEmpty {
            print(-1)
        } else {
            print(deque.removeLast())
        }
    }
}

var deque: Deque<Int> = Deque<Int>()

var n: Int = Int(readLine()!)!

for _ in 0 ..< n {
    var command = readLine()!.split(separator: " ")

    var input: Int = 0
    if command.count == 2 {
        input = Int(command.popLast()!)!
    }

    switch String(command[0]) {
    case "push_front":
        deque.pushFront(input)
    case "push_back":
        deque.pushBack(input)
    case "pop_front":
        deque.popFront()
    case "pop_back":
        deque.popBack()
    case "size":
        deque.getSize()
    case "empty":
        deque.isEmpty()
    case "front":
        deque.getFront()
    case "back":
        deque.getBack()
    default:
        break
    }
}
