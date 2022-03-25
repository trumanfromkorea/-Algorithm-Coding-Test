import Foundation

let n: Int = Int(readLine()!)!

let nums: [Int] = readLine()!.split(separator: " ").map { Int(String($0))! }

// i 까지 연속합 중 최대값만을 저장할 것이기 때문에 1차원으로 해결 가능
var DP: [Int] = Array(repeating: 0, count: n)
var answer = nums[0]

DP[0] = nums[0]

// i-1 까지 연속합 + i 번째 수
// i 번째 수
// --> 더 큰값
for i in 1 ..< n {
    DP[i] = max(DP[i - 1] + nums[i], nums[i])
    answer = max(answer, DP[i])
}

print(answer)
