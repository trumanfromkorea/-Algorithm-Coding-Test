import Foundation

// let param1 = ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]
// let param2 = [2, 3, 4]

// let param1 = ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]
// let param2 = [2, 3, 5]

let param1 = ["XYZ", "XWY", "WXA"]
let param2 = [2, 3, 4]

let result = solution(param1, param2)
print(result)

func solution(_ orders: [String], _ courses: [Int]) -> [String] {
    var answer: [String] = []
    var temp: [String] = []
    var dict: [[String]: Int] = [:]

    func combinations(_ order: [String], _ count: Int, _ index: Int) {
        if temp.count == count {
            if let _ = dict[temp] {
                dict[temp]! += 1
            } else {
                dict[temp] = 1
            }
        }

        for i in index ..< order.count {
            temp.append(order[i])
            combinations(order, count, i + 1)
            temp.removeLast()
        }
    }

    for order in orders {
        let ord = order.sorted().map { String($0) }

        for course in courses {
            if order.count > course {
                combinations(ord, course, 0)
            } else if order.count == course {
                if let _ = dict[ord] {
                    dict[ord]! += 1
                } else {
                    dict[ord] = 1
                }
            }
        }
    }

    for course in courses {
        let newDict = dict.filter({ $0.key.count == course })

        guard let maxValue = newDict.values.max() else {
            break
        }

        let filtered = newDict.filter({ $0.value == maxValue && $0.value >= 2 }).map { $0.key.joined(separator: "") }

        answer.append(contentsOf: filtered)
    }

    return answer.sorted()
}
