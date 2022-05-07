import Foundation
func solution(_ survey: [String], _ choices: [Int]) -> String {
    var answer = ""
    let types: [String] = ["RT", "CF", "JM", "AN"]

    var userType: [String: Int] = [:]

    for type in types {
        userType["\(type.first!)"] = 0
        userType["\(type.last!)"] = 0
    }

    for (option, score) in zip(survey, choices) {
        if score < 4 {
            userType["\(option.first!)"]! += 4 - score
        } else {
            userType["\(option.last!)"]! += score - 4
        }
    }

    for type in types {
        if userType["\(type.first!)"]! > userType["\(type.last!)"]! {
            answer += "\(type.first!)"
        } else if userType["\(type.first!)"]! < userType["\(type.last!)"]! {
            answer += "\(type.last!)"
        } else {
            answer += min("\(type.last!)", "\(type.first!)")
        }
    }

    return answer
}