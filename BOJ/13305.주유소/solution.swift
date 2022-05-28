import Foundation

let n = Int(readLine()!)!

let distance = readLine()!.split(separator: " ").map { Int(String($0))! }
let fuel = readLine()!.split(separator: " ").map { Int(String($0))! }

var sum = 0
var minVal = fuel.first!

for i in 0 ..< distance.count {
    minVal = min(minVal, fuel[i])
    sum += minVal * distance[i]
}

print(sum)
