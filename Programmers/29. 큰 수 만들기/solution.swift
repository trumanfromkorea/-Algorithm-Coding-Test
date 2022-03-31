import Foundation

func solution(_ number: String, _ _k: Int) -> String {
    let numbers = number.map { Int(String($0))! }
    var list: [Int] = []

    var k = _k
    let answerCount = numbers.count - k

    var answer = ""

    for (i, n) in numbers.enumerated() {
        while k > 0 && !list.isEmpty && list.last! < n {
            list.removeLast()
            k -= 1
        }

        if k == 0 {
            list += numbers[i...]
            break
        }

        list.append(n)
    }

    answer = list[0 ..< answerCount].map { "\($0)" }.joined()

    return answer
}