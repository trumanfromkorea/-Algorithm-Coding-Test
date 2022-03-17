import Foundation

// MARK: - 구현부

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (n, total) = (input[0], input[1])

var things: [Product] = []

var DP: [[Int]] = Array(repeating: Array(repeating: 0, count: total + 1), count: n)

for _ in 0 ..< n {
    let something = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (weight, value) = (something[0], something[1])

    things.append(Product(weight: weight, value: value))
}

for (i, p) in things.enumerated() {
    for j in 0 ... total {
        
        if i == 0 {
            if j >= p.weight {
                DP[i][j] = p.value
            }
            continue
        }

        if j < p.weight {
            DP[i][j] = DP[i - 1][j]
        } else {
            DP[i][j] = max(DP[i - 1][j], DP[i - 1][j - p.weight] + p.value)
        }
    }
}

print(DP[n - 1][total])

// MARK: - 선언부

struct Product {
    var weight: Int
    var value: Int
}
