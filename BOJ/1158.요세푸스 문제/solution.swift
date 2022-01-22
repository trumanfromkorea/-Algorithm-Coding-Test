import Foundation

var input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var n: Int = input.removeFirst()
var k: Int = input.removeFirst()
var index: Int = k - 1
var answer: String = "<"

var queue: [Int] = Array(1 ... n)

while !queue.isEmpty {
    if index < queue.count {
        let pop: Int = queue.remove(at: index)
        answer += queue.isEmpty ? "\(pop)>" : "\(pop), "
        index += k - 1
    } else {
        index = index % queue.count
    }
}

print(answer)
