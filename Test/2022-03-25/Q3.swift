import Foundation

// 실행부

let result = solution([3, 7, 2, 8, 6, 4, 5, 1], 3)

print(result)

// 선언부

func solution(_ _numbers: [Int], _ _k: Int) -> Int {
    let k = _k
    var numbers = _numbers

    var visited: [Bool] = Array(repeating: false, count: numbers.count)
    var answer: Int = .max

    if satisfied(numbers, k) {
        return 0
    }

    var permuted: [Int] = Array(repeating: 0, count: numbers.count)
    checkSwap(count: 0, numbers: numbers, permuted: &permuted, visited: &visited, k: k, answer: &answer)

    return answer == .max ? -1 : answer
}

// 모든 조건에 만족하는지
func satisfied(_ numbers: [Int], _ k: Int) -> Bool {
    for i in 0 ..< numbers.count - 1 {
        if abs(numbers[i] - numbers[i + 1]) > k {
            return false
        }
    }

    return true
}

// swap 검사 (?)
func checkSwap(
    count: Int,
    numbers: [Int],
    permuted: inout [Int],
    visited: inout [Bool],
    k: Int,
    answer: inout Int
) {
    let length: Int = numbers.count

    if count == length {
        if !satisfied(permuted, k) {
            return
        }

        var tempArray = permuted
        var swapCount = 0

        for i in 0 ..< length {
            if tempArray[i] == numbers[i] {
                continue
            }

            for j in 0 ..< length {
                if numbers[i] == tempArray[j] {
                    swapCount += 1

                    tempArray.swapAt(i, j)

                    if swapCount > answer {
                        return
                    }

                    break
                }
            }
        }
        if swapCount != 0 {
            answer = min(answer, swapCount)
        }
        return
    }

    for i in 0 ..< length {
        if visited[i] {
            continue
        }

        visited[i] = true
        permuted[count] = numbers[i]
        checkSwap(count: count + 1, numbers: numbers, permuted: &permuted, visited: &visited, k: k, answer: &answer)
        visited[i] = false
    }
}
