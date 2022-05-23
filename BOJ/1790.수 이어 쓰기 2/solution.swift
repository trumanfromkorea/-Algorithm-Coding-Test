import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var (n, k) = (input[0], input[1])

var counts = 9
var digit = 1
var minus = digit * counts

var num = 0

while k > minus {
    k -= minus

    num += counts
    counts *= 10
    digit += 1

    minus = digit * counts
}

let increase = (k - 1) / digit
let mod = (k - 1) % digit

num += increase + 1

if num > n {
    print(-1)
} else {
    let label = "\(num)"
    let index = label.index(label.startIndex, offsetBy: mod)

    print(label[index])
}

// 1자리수 9
// 2자리수 90 * 2
// 3자리수 900 * 3
// 4자리수 9000 * 4
// 5자리수 90000 * 5
