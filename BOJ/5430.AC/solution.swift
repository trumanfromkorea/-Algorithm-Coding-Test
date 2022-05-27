import Foundation

let n = Int(readLine()!)!
var answer: [String] = []

outerLoop: for _ in 0 ..< n {
    let option = readLine()!.map { String($0) }
    let count = Int(readLine()!)!

    let arr = readLine()!
        .replacingOccurrences(of: "[\\[\\]]", with: "", options: .regularExpression)
        .split(separator: ",")
        .map { Int(String($0))! }

    var (start, end) = (0, count - 1)
    var reversed = false

    innerLoop: for letter in option {
        if letter == "R" {
            swap(&start, &end)
            reversed.toggle()
        } else if letter == "D" {
            if !reversed && start <= end {
                start += 1
            } else if reversed && start >= end {
                start -= 1
            } else {
                answer.append("error")
                continue outerLoop
            }
        }
    }

    var result = ""

    while (reversed && start >= end) || (!reversed && start <= end) {
        result += "\(arr[start])" + (start != end ? "," : "")
        start += reversed ? -1 : 1
    }

    answer.append("[\(result)]")
}

for item in answer {
    print(item)
}
