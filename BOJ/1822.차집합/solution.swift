import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

let setA = Set(readLine()!.split(separator: " ").map { Int($0)! })
let setB = Set(readLine()!.split(separator: " ").map { Int($0)! })

let result = setA.subtracting(setB)

print(result.count)

if !result.isEmpty {
    for i in result.sorted() {
        print(i, terminator: " ")
    }
}
