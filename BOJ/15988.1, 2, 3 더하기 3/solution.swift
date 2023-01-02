import Foundation

let MOD = 1000000009

var dp: [Int] = []
var numbers: [Int] = []
var maxCase = 0

let n = Int(readLine()!)!

for _ in 0 ..< n {
    let input = Int(readLine()!)!
    numbers.append(input)
    maxCase = max(maxCase, input)
}

dp.append(1)
dp.append(1)
dp.append(2)

if maxCase >= 3 {
    for i in 3 ... maxCase {
        dp.append((dp[i - 1] + dp[i - 2] + dp[i - 3]) % MOD)
    }
}

for i in 0 ..< numbers.count {
    print(dp[numbers[i]])
}
