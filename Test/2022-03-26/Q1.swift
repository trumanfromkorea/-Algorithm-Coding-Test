import Foundation

func solution(_ logs: [String]) -> Int {
    var answer = 0

    for l in logs {
        var log = l

        var split = log.split(separator: " ").map { String($0) }

        // 로그 길이 100 초과
        if log.count > 100 {
            answer += 1
            continue
        }
        // 다른 공백 혹은 누락
        else if split.count != 12 {
            answer += 1
            continue
        }
        // 로그 이름이 잘못됐을때
        else if !checkLogName(split) {
            answer += 1
            continue
        }
        // 숫자, 특수문자 포함인지
        else if isNotChar(split) {
            answer += 1
            continue
        }
        // 연속된 공백
        else if continousSpace(log) {
            answer += 1
            continue
        }
        // 맨 앞에 공백
        else if log.removeFirst() == " " {
            answer += 1
            continue
        }
    }

    return answer
}

// 항목 이름 제대로 들어갔는지 검사
func checkLogName(_ log: [String]) -> Bool {
    if !log.contains("team_name")
        || !log.contains("application_name")
        || !log.contains("error_level")
        || !log.contains("message")
    {
        return false
    }

    return true
}

// 문자가 아니라면
func isNotChar(_ log: [String]) -> Bool {
    var colons = 0

    for i in 0 ..< log.count {
        if i == 0 || i == 3 || i == 6 || i == 9 {
            continue
        }

        if log[i] == ":" {
            colons += 1
            continue
        }

        for c in log[i] {
            if c < "A" || c > "z" {
                return true
            }
            if c > "Z" && c < "a" {
                return true
            }
        }
    }
    
    if colons != 4 {
        return true
    }
    
    return false
}

// 연속된 공백
func continousSpace(_ log: String) -> Bool {
    var flag = false

    for c in log {
        if c == " " {
            if flag {
                return true
            } else {
                flag = true
            }
        } else {
            flag = false
        }
    }

    return false
}

