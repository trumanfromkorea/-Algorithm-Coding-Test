import Foundation

func solution(_ s: String) -> Int {
    var bracket = s
    var answer = 0

    for _ in 0 ..< bracket.count {
        answer += isValidBracket(bracket) ? 1 : 0

        bracket += String(bracket.removeFirst())
    }

    return answer
    
}

func isValidBracket(_ bracket: String) -> Bool {
    var stack: String = ""

    for b in bracket {
        if b == "(" || b == "{" || b == "[" {
            stack.append(String(b))
        } else if !stack.isEmpty {
            if b == ")" && stack.last! == "(" {
                stack.removeLast()
            } else if b == "}" && stack.last! == "{" {
                stack.removeLast()
            } else if b == "]" && stack.last! == "[" {
                stack.removeLast()
            }
        } else if stack.isEmpty {
            stack.append(String(b))
        }
    }

    return stack.isEmpty
}
