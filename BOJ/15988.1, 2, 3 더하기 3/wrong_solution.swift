import Foundation

let DIVIDE_NUM = 1000000009

var answer = ""
var dict: [Int: Int] = [:]
var numbers: [Int] = []
var maxCase = 0

let n = Int(readLine()!)!

for _ in 0 ..< n {
    let input = Int(readLine()!)!
    numbers.append(input)
    dict[input] = 0
    maxCase = max(maxCase, input)
}

for i in 1 ... 3 {
    bfs(start: Node(numbers: [i], sum: i))
}

for i in 0 ..< numbers.count {
    print(dict[numbers[i]]! % DIVIDE_NUM)
}

func bfs(start: Node) {
    var visited: Set<Node> = []
    var queue: [Node] = []
    var pointer = 0

    queue.append(start)
    visited.insert(start)

    while pointer < queue.count {
        let now = queue[pointer]
        pointer += 1

        for i in 1 ... 3 {
            let next = now.nextNode(i)

            if visited.contains(next) || next.sum > maxCase {
                continue
            }

            if numbers.contains(next.sum) {
                dict[next.sum]! += 1
            }

            queue.append(next)
            visited.insert(next)
        }
    }
}

struct Node: Hashable {
    var numbers: [Int]
    var sum: Int

    func nextNode(_ num: Int) -> Node {
        Node(numbers: numbers + [num], sum: sum + num)
    }
}
