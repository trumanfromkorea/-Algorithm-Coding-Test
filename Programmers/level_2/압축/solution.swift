func solution(_ msg: String) -> [Int] {
    var answer: [Int] = []

    let message = msg.map { String($0) }
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }

    var dict: [String: Int] = [:]
    var partialWord = ""
    var lastIndex = 26
    var index = 0

    for i in 0 ..< lastIndex {
        dict[alphabet[i]] = i + 1
    }

    if message.count == 1 {
        return [dict[message[0]]!]
    }

    while true {
        var key = message[index]
        var last = key

        while dict[key] != nil {
            index += 1
            last = key
            
            if index >= message.count { break }

            
            key += message[index]
        }

        answer.append(dict[last]!)
        lastIndex += 1
        dict[key] = lastIndex
        
        if index >= message.count { break }
    }

    return answer
}



