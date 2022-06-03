func solution(_ s: String) -> Int {
    let dict: [String: String] = [
        "zero": "0", "one": "1", "two": "2", "three": "3", "four": "4",
        "five": "5", "six": "6", "seven": "7", "eight": "8", "nine": "9",
    ]

    var answer = ""
    var temp = ""

    for char in s {
        if char.isLetter {
            temp += String(char)
            if let number = dict[temp] {
                answer += String(number)
                temp = ""
            }
        } else {
            answer += String(char)
        }
    }

    return Int(answer)!
}
