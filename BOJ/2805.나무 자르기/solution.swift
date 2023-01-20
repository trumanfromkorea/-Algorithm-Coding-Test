import Foundation

func calculate(height: Int) -> Int {
    var sum = 0

    for i in 0 ..< trees.count {
        let tree = trees[i]

        if height < tree {
            sum += (tree - height)
        }
    }

    return sum
}

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

let trees = readLine()!.split(separator: " ").map { Int(String($0))! }

var top = trees.max()!
var bottom = 1
var mid = (top + bottom) / 2

while bottom <= top {
    let result = calculate(height: mid)

    if result > m {
        bottom = mid + 1
    } else if result < m {
        top = mid - 1
    } else {
        break
    }

    mid = (top + bottom) / 2
}

print(mid)
