// 테스트케이스 8개중 2개 시간초과

import Foundation

func solution(_ numbers: [Int], _ k: Int) -> Int {
    var indexes: [[Int]] = []

    let n = numbers.count
    var num = numbers

    indexes = getIndexes(Array(0 ..< n))

    for i in 0 ..< indexes.count {
        let comIdx = CIndexes(indexes, i)

        for com in comIdx {
            print(com)
            for c in com {
                num.swapAt(c[0], c[1])
            }
            if satisfied(num, k) {
                return com.count
            } else {
                num = numbers
            }
        }
    }

    return -1
}

func getIndexes(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    var visited = Array(repeating: false, count: nums.count)

    func combination(_ index: Int, _ now: [Int]) {
        if now.count == 2 {
            result.append(now)
            return
        }

        for i in index ..< nums.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                combination(i + 1, now + [nums[i]])
                visited[i] = false
            }
        }
    }

    combination(0, [])

    return result
}

func CIndexes(_ nums: [[Int]], _ n: Int) -> [[[Int]]] {
    var result: [[[Int]]] = []
    var visited = Array(repeating: false, count: nums.count)

    func combination(_ index: Int, _ now: [[Int]]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index ..< nums.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                combination(i + 1, now + [nums[i]])
                visited[i] = false
            }
        }
    }

    combination(0, [])

    return result
}

// k 이하임을 만족하는지
func satisfied(_ numbers: [Int], _ k: Int) -> Bool {
    for i in 0 ..< numbers.count - 1 {
        if abs(numbers[i] - numbers[i + 1]) > k {
            return false
        }
    }

    return true
}

// 모든 순서쌍 구하기
func permutation(_ numbers: [[Int]], _ n: Int, _ k: Int, _ P: inout [[[Int]]]) {
    if n == 0 {
        P.append(numbers)

    } else {
        var num = numbers
        permutation(num, n - 1, k, &P)

        for i in 0 ..< n {
            num.swapAt(i, n)
            permutation(num, n - 1, k, &P)
            num.swapAt(i, n)
        }
    }
}