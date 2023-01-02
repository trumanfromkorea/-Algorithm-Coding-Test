import Foundation

class Gear {
    var id: Int
    var nodes: [Int]
    var top: Int
    var left: Int?
    var right: Int?

    var willRotate = false

    init(id: Int, nodes: [Int]) {
        self.id = id
        self.nodes = nodes
        top = nodes[0]
        left = nodes[6]
        right = nodes[2]
    }

    func rotate(_ flag: Int) {
        if !willRotate { return }

        if flag == 1 {
            let last = nodes.removeLast()
            nodes.insert(last, at: 0)
        } else {
            let first = nodes.removeFirst()
            nodes.append(first)
        }
        top = nodes[0]
        left = nodes[6]
        right = nodes[2]

        willRotate = false
    }
}

var gears: [Gear] = []

for i in 1 ... 4 {
    let input = readLine()!.map { Int(String($0))! }

    gears.append(Gear(id: i, nodes: input))
}

let n = Int(readLine()!)!

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (num, rotate) = (input[0], input[1])

    var index = num - 1

    gears[index].willRotate = true

    while index < 3 {
        if gears[index].right != gears[index + 1].left {
            gears[index + 1].willRotate = true
        } else {
            break
        }

        index += 1
    }

    while index > 0 {
        if gears[index].left != gears[index - 1].right {
            gears[index - 1].willRotate = true
        } else {
            break
        }

        index -= 1
    }

    for i in 0 ..< 4 {
        if abs(num - 1 - i) % 2 == 1 {
            gears[i].rotate(-rotate)
        } else {
            gears[i].rotate(rotate)
        }
    }
}

var score = 0

for i in 0 ..< 4 {
    if gears[i].top == 1 {
        score += Int(NSDecimalNumber(decimal: pow(2, i)))
    }
}

print(score)
