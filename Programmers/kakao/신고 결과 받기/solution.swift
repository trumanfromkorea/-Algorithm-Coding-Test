import Foundation

func solution(_ ids: [String], _ reports: [String], _ k: Int) -> [Int] {
    var users: [String: Set<String>] = [:]
    var reported: [String: Int] = [:]

    for report in reports {
        let splitted = report.split(separator: " ").map { String($0) }
        let (sender, receiver) = (splitted[0], splitted[1])

        if let user = users[sender], user.contains(receiver) {
            continue
        }

        if users[sender] == nil {
            users[sender] = [receiver]
        } else {
            users[sender]?.insert(receiver)
        }
        
        if reported[receiver] == nil {
            reported[receiver] = 1
        } else {
            reported[receiver]! += 1
        }
    }

    return ids.map { id in
        users[id]?.filter { reported[$0] ?? 0 >= k }.count ?? 0
    }
}
