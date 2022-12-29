import Foundation
import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ P : Int, _ C : Int) -> Int {
    let pairs = P / 2

    return pairs > C ? C : pairs
}