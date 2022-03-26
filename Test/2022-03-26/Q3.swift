import Foundation

func solution(_ num_teams: Int, _ remote_tasks: [String], _ office_tasks: [String], _ employees: [String]) -> [Int] {
    var homeDict: [Int: [Int]] = [:] // 각 팀마다 재택하는 인원들
    var teamCount = Array(repeating: 0, count: num_teams) // 각 팀마다 팀원 수
    var answer = [Int]()

    for i in 1 ... num_teams {
        homeDict[i] = []
    }

    for (i, emp) in employees.enumerated() {
        var tasks = emp.split(separator: " ").map { String($0) }
        var isOffice = false

        let team = Int(tasks.removeFirst())!

        teamCount[team - 1] += 1 // 팀원 수 추가
        
        // 출근 태스크 하나라도 있으면 출근
        for t in tasks {
            if office_tasks.contains(t) {
                isOffice = true
            }
        }
        
        // 출근 태스크 아예 없으면 재택
        if !isOffice {
            homeDict[team]!.append(i + 1)
        }
    }
    
    for (key, val) in homeDict {
        if val.count == teamCount[key - 1] {
            homeDict[key]!.removeFirst()
        }
    }
    
    for val in homeDict.values {
        answer += val
    }

    return answer.sorted()
}

