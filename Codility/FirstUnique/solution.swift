import Foundation
// import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    var dict: [Int: Int] = [:]

    for number in A {
        if dict[number] == nil {
            dict[number] = 1
        } else {
            dict[number]! += 1
        }
    }

    for number in A {
        if dict[number]! == 1 {
            return number
        }
    }

    return -1
}