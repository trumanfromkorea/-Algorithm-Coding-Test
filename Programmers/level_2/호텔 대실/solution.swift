import Foundation

func solution(_ bookTime: [[String]]) -> Int {
    var answer = 0
    var overlap = 0

    var startTimes: [Int: Int] = [:]
    var endTimes: [Int: Int] = [:]

    for i in 0 ..< bookTime.count {
        let start = timeStringToInt(bookTime[i][0])
        let end = timeStringToInt(bookTime[i][1]) + 9

        startTimes[start, default: 0] += 1
        endTimes[end, default: 0] += 1
    }

    for i in 0 ..< 24 * 60 {
        if let start = startTimes[i] {
            overlap += start
            answer = max(overlap, answer)
        }

        if let end = endTimes[i] {
            overlap -= end
        }
    }

    return answer
}

func timeStringToInt(_ timeString: String) -> Int {
    let splitted = timeString.split(separator: ":").map { Int(String($0))! }

    return splitted[0] * 60 + splitted[1]
}
