import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var locations = readLine()!.map { String($0) }
var answer = 0

for i in 0 ..< n {
    if locations[i] == "P" {
        for j in max(0, i - k) ..< min(n, i + k + 1) {
            if locations[j] == "H" {
                answer += 1
                locations[j] = ""
                break
            }
        }
    }
}

print(answer)

