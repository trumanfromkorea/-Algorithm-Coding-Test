import Foundation

func solution(_ stones: [Int], _ k: Int) -> Int {
    var low = 1
    var high = 200000000

    var answer = 0

    while low <= high {
        let mid = (high + low) / 2

        if isAvailable(stones, mid: mid, k: k) {
            answer = max(answer, mid)
            low = mid + 1
        } else {
            high = mid - 1
        }
    }

    return answer
}

func isAvailable(_ stones: [Int], mid: Int, k: Int) -> Bool {
    var count = 0

    for i in 0 ..< stones.count {
        if stones[i] < mid {
            count += 1
        } else {
            count = 0
        }
        
        if count == k {
            return false
        }
    }

    return true
}
