import Foundation

let n = Int(readLine()!)!
let boxes = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: 1, count: n)

for i in 0 ..< n {
    for j in 0 ..< i {
        if boxes[i] > boxes[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
