import Foundation

var array: [Int] = []
var sum: Int = 0
var mod: Int = 0
var (a, b) = (-1, -1)

for _ in 0 ..< 9 {
    let input = Int(readLine()!)!

    array.append(input)
    sum += input
}

mod = sum - 100

for i in 0 ..< 9 {
    for j in i + 1 ..< 9 {
        if array[i] + array[j] == mod {
            (a, b) = (i, j)
        }
    }
}

for i in 0 ..< 9 {
    if i != a && i != b {
        print(array[i])
    }
}
