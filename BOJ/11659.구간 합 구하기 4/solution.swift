import Foundation

var answer = ""

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

let array = readLine()!.split(separator: " ").map { Int($0)! }

var sums: [Int] = [array[0]]

for i in 1 ..< n {
    let item = sums[i - 1] + array[i]
    sums.append(item)
}

for i in 0 ..< m {
    let range = readLine()!.split(separator: " ").map { Int($0)! }
    let (start, end) = (range[0] - 1, range[1] - 1)

    let result = start == 0 ? sums[end] : sums[end] - sums[start - 1]

    answer += "\(result)\n"
}

print(answer)
