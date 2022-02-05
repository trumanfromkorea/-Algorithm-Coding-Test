import Foundation

var n: Int = Int(readLine()!)!
var answer: String = ""
var stack: [String] = []
var isVPS: Bool

for _ in 0 ..< n {
    isVPS = true
    stack.removeAll()
    
    let bracket: String = readLine()!
    
    for b in bracket {
        if b == "(" {
            stack.append("(")
        } else {
            if stack.isEmpty {
                isVPS = false
                break
            } else {
                stack.removeLast()
            }
        }
    }
    
    if !stack.isEmpty {
        answer += "NO\n"
    } else if isVPS {
        answer += "YES\n"
    } else {
        answer += "NO\n"
    }
}

print(answer)
