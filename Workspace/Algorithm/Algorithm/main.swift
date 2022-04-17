import Foundation

let n: Int = Int(readLine()!)!

var stairs: [Int] = [0]
var DP: [Int] = Array(repeating: 0, count: n+1)

for _ in 0 ..< n {
    stairs.append(Int(readLine()!)!)
}

if n == 1 {
    print(stairs[1])
    exit(0)
} else if n == 2 {
    print(stairs[1] + stairs[2])
    exit(0)
}

DP[1] = stairs[1]
DP[2] = stairs[1] + stairs[2]

for i in 3 ... n {
    DP[i] = max(DP[i - 2], stairs[i - 1] + DP[i - 3]) + stairs[i]
}

print(DP.last!)
