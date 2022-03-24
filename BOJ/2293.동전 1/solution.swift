import Foundation

// MARK: - 구현부

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (n, cost) = (input[0], input[1])

var DP: [Int] = Array(repeating: 0, count: cost + 1)
DP[0] = 1

var coin: [Int] = []

for _ in 0 ..< n {
    let c = Int(readLine()!)!
    coin.append(c)
}

for i in 0 ..< n {
    for j in coin[i] ... cost {
        if coin[i] <= j {
            DP[j] += DP[j - coin[i]]
        }

        if DP[j] > Int(pow(2.0, 31.0)) {
            DP[j] = 0
        }
    }
}

print(DP[cost])