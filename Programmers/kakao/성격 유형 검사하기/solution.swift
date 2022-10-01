func solution(_ survey: [String], _ choices: [Int]) -> String {
    var answer = ""

    let scores = [3, 2, 1, 0, 1, 2, 3]
    var dict: [String: Int] = [:]

    "RTCFHMAN".forEach { dict[String($0)] = 0 }

    for (type, index) in zip(survey, choices) {
        let separated = type.map { String($0) }

        var key = ""

        if index < 4 {
            key = separated[0]
        } else if index > 4 {
            key = separated[1]
        } else {
            continue
        }

        if let value = dict[key] {
            dict[key] = value + scores[index - 1]
        } else {
            dict[key] = scores[index - 1]
        }
    }

    ["RT", "CF", "JM", "AN"].forEach { types in
        let separated = types.map { String($0) }.sorted()

        if let first = dict[separated[0]],
           let second = dict[separated[1]] {
            if first < second {
                answer += separated[1]
            } else {
                answer += separated[0]
            }
        }
    }

    return answer
}
