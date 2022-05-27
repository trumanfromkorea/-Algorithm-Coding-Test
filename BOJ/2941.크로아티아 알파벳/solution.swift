import Foundation

let croatian = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]

var label = readLine()!
var answer = 0

for item in croatian {
    if label.contains(item) {
        let separated = label.components(separatedBy: item)
        answer += separated.count - 1

        label = separated.joined(separator: "!")
    }
}

label = label.components(separatedBy: "!").joined(separator: "")
print(answer + label.count)
