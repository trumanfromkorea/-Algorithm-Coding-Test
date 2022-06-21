import Foundation

class Node<T: Equatable> {
    var id: Int
    let data: T
    var next: Node?

    init(id: Int, data: T, next: Node? = nil) {
        self.id = id
        self.data = data
        self.next = next
    }
}

struct LinkedList<T: Equatable> {
    var header: Node<T>?
    var tail: Node<T>?
    var count: Int = 0

    // 맨 뒤 삽입
    mutating func add(data: T) {
        let newNode = Node(id: count, data: data)
        count += 1

        if header == nil {
            header = newNode
            tail = newNode

            return
        }

        tail?.next = newNode
        tail = newNode
    }

    // 원하는 인덱스에 삽입
    mutating func insert(data: T, at index: Int) {
        if index > count {
            print("index out of range")
            return
        }

        count += 1

        let newNode = Node(id: index, data: data)
        var now = header

        if index == 0 {
            header = newNode
            newNode.next = now

            while now != nil {
                now?.id += 1
                now = now?.next
            }

            return
        }

        if index == count {
            add(data: data)
            return
        }

        while now!.id < index - 1 {
            now = now?.next
        }

        newNode.next = now?.next
        now?.next = newNode
        now = now?.next

        while now != nil {
            now = now?.next
            now?.id += 1
        }
    }
    
    // 삭제
    @discardableResult
    mutating func delete(at index: Int) -> Bool {
        if index >= count {
            print("index out of range")
            return false
        }
        count -= 1

        var now = header

        if index == 0 {
            header = header?.next

            while now != nil {
                now?.id -= 1
                now = now?.next
            }

            return true
        }

        while now!.id < index - 1 {
            now = now?.next
        }

        if now?.next === tail {
            tail = now
        }

        now?.next = now?.next?.next
        now = now?.next

        while now != nil {
            now?.id -= 1
            now = now?.next
        }

        return true
    }

    // 탐색
    @discardableResult
    func search(with data: T) -> Node<T>? {
        var now = header

        while now?.data != data && now != nil {
            now = now?.next
        }

        if now == nil {
            print("not found")
        } else {
            print("id: \(now!.id) | data: \(now!.data)")
        }

        return now
    }

    // 출력
    func printList() {
        var now = header

        print("List Size: \(count)")
        while now != nil {
            let output = "-> id: \(now!.id) | data: \(now!.data)"
            print(output)
            now = now?.next
        }
    }
}

// MARK: - 동작 예시

var linkedList = LinkedList<Int>()

outerLoop: while true {
    print("==================")
    let option = readLine()!

    switch option {
    case "add":
        let input = Int(readLine()!)!
        linkedList.add(data: input)

    case "insert":
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        linkedList.insert(data: input[1], at: input[0])

    case "delete":
        let input = Int(readLine()!)!
        linkedList.delete(at: input)

    case "search":
        let input = Int(readLine()!)!
        linkedList.search(with: input)

    case "print":
        linkedList.printList()

    case "quit":
        break outerLoop

    default:
        break
    }
}
