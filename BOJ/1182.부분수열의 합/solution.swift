import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

let array = readLine()!.split(separator: " ").map { Int($0)! }

var sum = 0
var items: [Int] = []
var answer = 0

recursive(index: 0, target: m, items: &items, sum: &sum, count: &answer)

print(answer)

func recursive(index: Int, target: Int, items: inout [Int], sum: inout Int, count: inout Int) {

    if sum == target && !items.isEmpty {
        count += 1
    }
    
    for i in index ..< array.count {
        items.append(array[i])
        sum += array[i]
        
        recursive(index: i + 1, target: target, items: &items, sum: &sum, count: &count)
        
        items.removeLast()
        sum -= array[i]
    }
    
}
