import Foundation

func solution(_ gems: [String]) -> [Int] {
    var answerStart = 0
    var answerEnd = gems.count

    var start = 0, end = -1, count = 0
    let typeCount = Set(gems).count
    var dict: [String: Int] = [:]

    while start < gems.count && end < gems.count {
        count = dict.count

        if count == typeCount {
            if answerEnd - answerStart > end - start {
                answerStart = start
                answerEnd = end
            }

            if start == end {
                break
            }

            if let value = dict[gems[start]] {
                if value == 1 {
                    dict.removeValue(forKey: gems[start])
                } else {
                    dict[gems[start]] = value - 1
                }
            }

            start += 1
        } else {
            end += 1

            if end < gems.count {
                if let value = dict[gems[end]] {
                    dict[gems[end]] = value + 1
                } else {
                    dict[gems[end]] = 1
                }
            }
        }
    }

    return [answerStart + 1, answerEnd + 1]
}