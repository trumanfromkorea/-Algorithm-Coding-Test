import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (input[0], input[1])

let sharedCards = readLine()!.split(separator: " ").map { Int(String($0))! }
let teamCards = readLine()!.split(separator: " ").map { Int(String($0))! }

var cases: [Card] = []

for shared in sharedCards {
    for team in teamCards {
        cases.append(Card(number: team, maxScore: team * shared))
    }
}

for _ in 0 ..< k {
    let max = cases.max(by: { $0.maxScore < $1.maxScore })!
    cases.removeAll(where: { $0.number == max.number })
}

print(cases.max(by: { $0.maxScore < $1.maxScore })!.maxScore)

struct Card: Hashable {
    let number: Int
    let maxScore: Int
}
