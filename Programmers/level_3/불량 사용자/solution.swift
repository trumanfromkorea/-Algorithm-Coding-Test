import Foundation

func solution(_ user_id: [String], _ banned_id: [String]) -> Int {
    var validation = [[String]]()
    var tempSet = Set<String>()
    var answer = Set<Set<String>>()

    for banned in banned_id {
        var temp = [String]()

        for user in user_id {
            if isValidID(user, banned) {
                temp.append(user)
            }
        }

        validation.append(temp)
    }

    func DFS(_ set: inout Set<String>, _ depth: Int) {
        if depth == validation.count {
            answer.insert(set)
            return
        }

        for i in 0 ..< validation[depth].count {
            if set.contains(validation[depth][i]) {
                continue
            }

            set.insert(validation[depth][i])
            DFS(&set, depth + 1)
            set.remove(validation[depth][i])
        }
    }

    DFS(&tempSet, 0)

    return answer.count
}

func isValidID(_ userId: String, _ bannedId: String) -> Bool {
    if userId.count != bannedId.count {
        return false
    }

    for (user, banned) in zip(userId, bannedId) {
        if String(banned) == "*" {
            continue
        }

        if user != banned {
            return false
        }
    }

    return true
}
