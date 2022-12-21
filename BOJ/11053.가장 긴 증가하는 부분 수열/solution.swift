import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").map { Int(String($0))! }

var dp = Array(repeating: 1, count: n)

for i in 0 ..< n {
    for j in 0 ..< i {
        if array[i] > array[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)
