public func solution(_ S: inout String) -> Int {
    // Implement your solution here

    let lowercase = "abcdefghijklmnopqrstuvwxyz".map { String($0) }
    let uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".map { String($0) }
    let numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].map { String($0) }

    var result = -1

    let passwords = S.components(separatedBy: " ")

    for password in passwords {
        var uppercaseCount = 0
        var lowercaseCount = 0
        var numberCount = 0
        var isValid = true

        for char in password.map({ String($0) }) {
            if lowercase.contains(char) {
                lowercaseCount += 1
            } else if uppercase.contains(char) {
                uppercaseCount += 1
            } else if numbers.contains(char) {
                numberCount += 1
            } else {
                isValid = false
                break
            }
        }

        if isValid
            && (uppercaseCount + lowercaseCount) % 2 == 0
            && numberCount % 2 == 1 {
            result = max(result, password.count)
        }
    }


    return result
}
