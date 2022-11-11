import Foundation

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    var answer = ""
    
    var radixString = ""
    var radixArray: [String] = []
    var index = p - 1

    for i in 0 ... m * t {
        radixString += String(i, radix: n, uppercase: true)
    }
    
    radixArray = radixString.map { String($0) }

    while index < radixArray.count && answer.count < t {
        answer += radixArray[index]
        index += m
    }

    return answer
}
