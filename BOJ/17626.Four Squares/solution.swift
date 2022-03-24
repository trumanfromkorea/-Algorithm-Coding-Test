import Foundation

let n: Int = Int(readLine()!)!

var DP: [Int] = Array(repeating: 0, count: n + 1)
DP[1] = 1

for i in 2 ... n {
    DP[i] = 4
    let sqrt = Int(sqrt(Double(i)))
    
    for j in 1 ... sqrt {
        if DP[i] > DP[i - j * j] + 1 {
            DP[i] = DP[i - j * j] + 1
        }
    }
}

print(DP[n])