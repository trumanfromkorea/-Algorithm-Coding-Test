import Foundation

let n = Int(readLine()!)!

var cardSet = Set<Int>()

readLine()!.split(separator: " ").forEach { cardSet.insert(Int(String($0))!) }

let m = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
var answer = ""

for item in array {
    if cardSet.contains(item) {
        answer += "1 "
    } else {
        answer += "0 "
    }
}

print(answer)
