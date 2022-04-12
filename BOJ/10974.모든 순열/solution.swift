import Foundation

let n: Int = Int(readLine()!)!

let array: [Int] = Array(1 ... n)

var temp: [Int] = []
var visited: [Bool] = Array(repeating: false, count: n)

var index: Int = 0
var answer: String = ""

permutations(0)

answer.removeLast()
print(answer)

// MARK: - 선언

func permutations(_ index: Int) {
    if index == n {
        for t in temp {
            answer += "\(t) "
        }
        answer += "\n"
        return
    }

    for i in 1 ... n {
        if !visited[i - 1] {
            visited[i - 1] = true
            temp.append(i)

            permutations(index + 1)

            visited[i - 1] = false
            temp.removeLast()
        }
    }
}
