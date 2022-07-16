import Foundation

func solution(_ s: String) -> [Int] {
    var string = s

    var values = [[Int]]()
    var number = 0

    var line = [Int]()
    var answer = [Int]()
    var dict = [Int: Int]()

    string.removeFirst()
    string.removeLast()

    for char in string {
        let item = String(char)

        if item == "{" {
            line = []
            number = 0
        } else if item == "}" {
            line.append(number)
            values.append(line)
        } else if item == "," {
            line.append(number)
            number = 0
        } else {
            number = number * 10 + Int(item)!
        }
    }

    values.sort { $0.count < $1.count }

    for value in values {
        for item in value {
            if dict[item] == nil {
                dict[item] = 0
            } else {
                dict[item]! += 1
            }
        }
    }

    let newDict = dict.sorted { $0.value > $1.value }
    answer = newDict.map { $0.key }

    return answer
}
