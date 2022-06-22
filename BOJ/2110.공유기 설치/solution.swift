import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
var array = [Int]()

for _ in 0 ..< n {
    array.append(Int(readLine()!)!)
}

array.sort()

var high = array.last! - array.first!
var low = Int.max

for i in 1 ..< n {
    low = min(low, array[i] - array[i - 1])
}

var set = Set<Int>()
var answer = 0

while low <= high {
    let mid = (high + low) / 2
    var index = 0
    var count = 1

    for i in 1 ..< n {
        if array[index] + mid <= array[i] {
            count += 1
            index = i
        }
    }

    if set.contains(mid) {
        break
    }

    if count >= m {
        set.insert(mid)
        low = mid + 1
    } else {
        high = mid - 1
    }
}

print(set.max()!)
