import Foundation

let n = Int(readLine()!)!

// 맨 마지막에 무조건 0 인 값이 나와서 다 더해줄 수 있도록
var histogram: [Int] = Array(repeating: 0, count: n + 2)
var stack: [Int] = []

var maxSize = 0

for i in 1 ... n {
    let input = Int(readLine()!)!
    histogram[i] = input
}

// Stack 이 비어있지 않기를 방지 (width 계산을 위해)
stack.append(0)

for i in 1 ... n + 1 {
    // 더 작은 값이 나오면 계속 pop 해서 넓이 업데이트
    while !stack.isEmpty && histogram[stack.last!] > histogram[i] {
        let top = stack.popLast()!
        
        maxSize = max(maxSize, histogram[top] * (i - stack.last! - 1))
    }
    stack.append(i)
}

print(maxSize)
