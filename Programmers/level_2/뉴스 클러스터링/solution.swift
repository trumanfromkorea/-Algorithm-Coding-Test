import Foundation

func solution(_ str1: String, _ str2: String) -> Int {
    let multiplier = 65536

    let dict1: [String: Int] = getDictSet(from: str1)
    let dict2: [String: Int] = getDictSet(from: str2)

    let intersectionCount = Set(dict1.keys).intersection(Set(dict2.keys))
        .reduce(0) { partialResult, value in
            partialResult + min(dict1[value] ?? 0, dict2[value] ?? 0)
        }

    let unionCount = Set(dict1.keys).union(Set(dict2.keys))
        .reduce(0) { partialResult, value in
            partialResult + max(dict1[value] ?? 0, dict2[value] ?? 0)
        }

    if intersectionCount == 0 && unionCount == 0 { return multiplier }

    let result = Int(Double(intersectionCount) / Double(unionCount) * Double(multiplier))

    return result
}

func getDictSet(from str: String) -> [String: Int] {
    var dict: [String: Int] = [:]
    let strArray = str.uppercased().map { "\($0)" }

    for i in 1 ..< strArray.count {
        let key = "\(strArray[i - 1])\(strArray[i])"

        if !isAlpha(key) { continue }

        dict[key] = (dict[key] ?? 0) + 1
    }

    return dict
}

func isAlpha(_ str: String) -> Bool {
    for char in str {
        if !char.isLetter {
            return false
        }
    }

    return true
}
