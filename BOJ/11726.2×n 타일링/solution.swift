import Foundation

let n: Int = Int(readLine()!)!

var DP: [Int] = Array(repeating: 0, count: n + 1)

DP[0] = 1
DP[1] = 1

for i in 1 ..< n {
    DP[i + 1] = (DP[i] + DP[i - 1]) % 10007
}

print(DP[n])
