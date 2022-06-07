import Foundation

struct Item {
    var start: Int
    var end: Int
}

let n = Int(readLine()!)!

var array = [Item]()
var answer = [Item]()

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }

    array.append(Item(start: input[0], end: input[1]))
}

for item in array.sorted(by: { first, second in
    if first.start == second.start {
        return first.end < second.end
    }

    return first.start < second.start
}) {
    if answer.isEmpty {
        answer.append(item)
        continue
    }

    if answer.last!.end > item.end {
        answer.removeLast()
        answer.append(item)
    } else {
        if answer.last!.end <= item.start {
            answer.append(item)
        }
    }
}

print(answer.count)
