import Foundation

// MARK: - 호출

let input = readLine()!.split(separator: " ").map { Int($0)! }

let (n, m) = (input[0], input[1])

var letters = readLine()!.split(separator: " ").map { String($0) }.sorted()

var answer: String = ""
var temp: [String] = []
var visited: [Bool] = Array(repeating: false, count: m)

let vowels = ["a", "e", "i", "o", "u"]

combinations(0)

answer.removeLast()
print(answer)

// MARK: - 선언

func combinations(_ index: Int) {
    if index == n {
        let vCount = countVowels(temp) 
        // 모음,자음 개수 따지기
        if vCount < 1 || n - vCount < 2 {
            return
        }

        answer += temp.joined(separator: "") + "\n"
        return
    }

    // for 문 시작점을 0 이 아니라 이전 인덱스부터 하면 visited 필요없음
    for i in 0 ..< m {
        if !visited[i] {
            // 알파벳 순서 검사
            if !temp.isEmpty && temp.last! > letters[i] {
                continue
            }

            visited[i] = true
            temp.append(letters[i])

            combinations(index + 1)

            visited[i] = false
            temp.removeLast()
        }
    }
}

func countVowels(_ str: [String]) -> Int {
    var count = 0

    for char in str {
        if vowels.contains(char) {
            count += 1
        }
    }

    return count
}
