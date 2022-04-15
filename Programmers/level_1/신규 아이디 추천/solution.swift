import Foundation

// MARK: - 실행

solution("...!@BaT#*..y.abcdefghijklm")

// MARK: - 선언

func solution(_ new_id: String) -> String {
    var id: String = new_id

    // 1단계
    id = id.lowercased()

    // 2단계
    var temp: String = ""

    for char in id {
        if char.isLetter || char.isNumber || char == "-" || char == "_" || char == "." {
            temp.append(char)
        }
    }
    id = temp

    // 3단계
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }

    // 4단계
    if id.hasPrefix(".") { id.removeFirst() }
    if id.hasSuffix(".") { id.removeLast() }

    // 5단계
    if id.isEmpty { id = "a" }

    // 6단계
    if id.count >= 16 {
        let index = id.index(id.startIndex, offsetBy: 15)
        id = String(id[id.startIndex ..< index])

        if id.hasSuffix(".") { id.removeLast() }
    }
    
    // 7단계
    while id.count < 3 {
        id += String(id.last!)
    }

    return id
}
