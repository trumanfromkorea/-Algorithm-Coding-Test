import Foundation

let n = Int(readLine()!)!
var answer = ""

for _ in 0 ..< n {
    let input = readLine()!.map { String($0) }
    let length = input.count

    answer += "\(isPalindrome(input, length, 0))\n"
}

print(answer)

// methods

func isSemiPalindrome(_ input: [String], _ start: Int, _ end: Int) -> Bool {
    var start = start
    var end = end

    while start < end {
        if input[start] == input[end] {
            start += 1
            end -= 1
        } else {
            return false
        }
    }
    return true
}

func isPalindrome(_ input: [String], _ length: Int, _ start: Int) -> Int {
    var start = start
    var end = length - 1

    while start < end {
        if input[start] == input[end] {
            start += 1
            end -= 1
        } else {
            let recursiveA = isSemiPalindrome(input, start + 1, end)
            let recursiveB = isSemiPalindrome(input, start, end - 1)

            if recursiveA || recursiveB {
                return 1
            } else {
                return 2
            }
        }
    }
    return 0
}
