import Foundation

let n: Int = Int(readLine()!)!
let array: [Int] = Array(1 ... n)

var visited: [Bool] = Array(repeating: false, count: n)
var result: [[Int]] = []

var permuted: [Int] = []

permutation()

// MARK: - 선언부

func permutation() {
    if permuted.count == n {
        printArray()
        return
    }

    for i in 0 ..< n {
        if visited[i] { continue }

        visited[i] = true
        permuted.append(i + 1)

        permutation()

        visited[i] = false
        permuted.removeLast()
    }
}

func printArray() {
    var output: String = ""
    
    for p in permuted {
        output += "\(p) "
    }
    
    print(output)
}
