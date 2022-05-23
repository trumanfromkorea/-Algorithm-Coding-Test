import Foundation

let n = Int(readLine()!)!

let liquid = readLine()!.split(separator: " ").map { Int(String($0))! }

var (start, end) = (0, n - 1)

var sub = Int.max
var (a, b) = (Int.min, Int.max)

solution()

func solution() {
    while start < end {
        let newLiquid = liquid[start] + liquid[end]

        if sub > abs(newLiquid) {
            sub = abs(newLiquid)
            a = liquid[start]
            b = liquid[end]
        }

        if newLiquid > 0 {
            end -= 1
        } else if newLiquid < 0 {
            start += 1
        } else {
            print(liquid[start], liquid[end])
            return
        }
    }
    print(a, b)
}
