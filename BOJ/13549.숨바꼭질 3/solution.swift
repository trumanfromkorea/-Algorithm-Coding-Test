import Foundation

struct Node {
    let position: Int
    let time: Int

    var forward: Node? {
        if position == 100000 { return nil }

        return Node(position: position + 1, time: time + 1)
    }

    var backward: Node? {
        if position == 0 { return nil }

        return Node(position: position - 1, time: time + 1)
    }

    var warp: Node? {
        if (0 ... 100000).contains(position * 2) {
            return Node(position: position * 2, time: time)
        }

        return nil
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])

var visited = Array(repeating: false, count: 100001)

var queue: [Node] = []
var pointer = 0
visited[n] = true
queue.append(Node(position: n, time: 0))

while queue.count > pointer {
    let now = queue[pointer]
    pointer += 1

    if now.position == k {
        print(now.time)
        break
    }

    for newNode in [now.warp, now.backward, now.forward].compactMap({ $0 }) {
        if !visited[newNode.position] {
            visited[newNode.position] = true
            queue.append(newNode)
        }
    }
}
