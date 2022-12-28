import Foundation
// import Glibc

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ A : inout [Int]) -> Int {
    let heights = A

    if heights.count <= 2 { return 0 }

    var depth = 0
    var top = heights[0]
    var bottom = heights[0]

    for i in 1 ..< heights.count {
        if bottom == heights[i] {
            continue
        } 

        if bottom > heights[i] {
            bottom = heights[i]
            continue
        } 

        if heights[i] < top {
            depth = max(depth, heights[i] - bottom)
        } else if heights[i] > top {
            depth = max(depth, top - bottom)
            top = heights[i]
            bottom = heights[i]
        } else {
            depth = max(depth, top - bottom) 
            bottom = top
        }

    }

    return depth
}