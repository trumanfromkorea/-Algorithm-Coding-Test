import Foundation

let ogString = readLine()!.map { String($0) }
let subString = readLine()!.map { String($0) }

let ogCount = ogString.count
let subCount = subString.count

var pi = Array(repeating: 0, count: subCount)

print(KMP() ? 1 : 0)

func KMP() -> Bool {
    getPI()

    var j = 0

    for i in 0 ..< ogCount {
        while j > 0 && ogString[i] != subString[j] {
            j = pi[j - 1]
        }

        if ogString[i] == subString[j] {
            if j == subCount - 1 {
                return true
            } else {
                j += 1
            }
        }
    }

    return false
}

func getPI() {
    var j = 0

    for i in 1 ..< subCount {
        while j > 0 && subString[i] != subString[j] {
            j = pi[j - 1]
        }

        if subString[i] == subString[j] {
            j += 1
            pi[i] = j
        }
    }
}
