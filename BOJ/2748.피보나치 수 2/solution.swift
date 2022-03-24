import Foundation

let n: Int = Int(readLine()!)!

var arr: [Int] = [0, 1]

if n == 1 {
    print(1)
} else {
    for i in 2 ... n {
        arr.append(arr[i - 1] + arr[i - 2])
    }

    print(arr.removeLast())
}