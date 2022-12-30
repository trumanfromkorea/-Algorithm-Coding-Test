import Foundation

// you can write to stdout for debugging purposes, e.g.
// print("this is a debug message")

public func solution(_ string : inout String) -> Int {
    var stringArray = string.map { String($0) }
    
    var (left, right) = (stringArray.count / 2, stringArray.count / 2)

    if stringArray.count % 2 == 0 || stringArray.isEmpty {
        return -1
    }

    while left >= 0 && right < stringArray.count {
        if stringArray[left] == stringArray[right] {
            left -= 1
            right += 1
        } else {
            break
        }
    }

    if left == -1 && right == stringArray.count {
        return stringArray.count / 2
    }

    return  -1
}