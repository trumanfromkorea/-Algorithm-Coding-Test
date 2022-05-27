import Foundation

var input = readLine()!.components(separatedBy: "-")
var reducer: [Int] = []
var answer = 0

for item in input {
    if Int(item) == nil {
        let sum = item.split(separator: "+").map { Int(String($0))! }.reduce(0, +)
        reducer.append(sum)
    } else {
        reducer.append(Int(item)!)
    }
}

answer = reducer.removeFirst()
answer = reducer.reduce(answer, -)

print(answer)
