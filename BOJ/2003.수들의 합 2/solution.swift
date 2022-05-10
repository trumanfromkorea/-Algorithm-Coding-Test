import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (n, m) = (input[0], input[1])

let array = readLine()!.split(separator: " ").map { Int(String($0))! }

var count = 0

var start = 0
var end = 0
var sum = array[0]

while end < n {
    if sum < m {
        increaseEnd()
    } else if sum > m {
        increaseStart()
    } else {
        increaseStart()
        increaseEnd()
        count += 1
    }
}

print(count)

func increaseEnd() {
    end += 1
    if end < n {
        sum += array[end]
    }
}

func increaseStart() {
    sum -= array[start]
    start += 1
}
