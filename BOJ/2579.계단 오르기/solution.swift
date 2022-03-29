import Foundation

let n: Int = Int(readLine()!)!

var stairs: [Int] = Array(repeating: 0, count: n + 1)

var DP: [Int] = Array(repeating: 0, count: n + 1)

var count: Int = 3

for i in 1 ... n {
    stairs[i] += Int(readLine()!)!
}

DP[1] = stairs[1]
DP[2] = DP[1] + stairs[2]

for i in 3 ... n {
    DP[i] = max(
        DP[i - 2],
        DP[i - 3] + stairs[i - 1]
    ) + stairs[i]
}

print(DP.removeLast())