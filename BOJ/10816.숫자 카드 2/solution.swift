import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var dict: [Int: Int] = [:]
for number in numbers {
    if dict[number] == nil {
        dict[number] = 1
    } else {
        dict[number]! += 1
    }
}

let m = Int(readLine()!)!
let answer = readLine()!
    .split(separator: " ")
    .map { "\(dict[Int($0)!] ?? 0)" }
    .joined(separator: " ")

print(answer)
