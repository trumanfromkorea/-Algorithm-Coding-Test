import Foundation

let n = Int(readLine()!)!
var dict: [String: Int] = [:]

for _ in 0 ..< n {
    let input = readLine()!.components(separatedBy: ".")
    let (key) = input[1]

    if dict[key] == nil {
        dict[key] = 1
    } else {
        dict[key]! += 1
    }
}

dict.sorted(by: { $0.key < $1.key }).forEach {
    print($0.key, $0.value)
}
