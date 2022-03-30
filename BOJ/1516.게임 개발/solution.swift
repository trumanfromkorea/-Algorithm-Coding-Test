import Foundation

let n: Int = Int(readLine()!)!

var preBuild: [[Int]] = Array(repeating: [], count: n + 1)
var line: [Int] = Array(repeating: 0, count: n + 1)
var DP: [Int] = Array(repeating: 0, count: n + 1)
var times: [Int] = Array(repeating: 0, count: n + 1)

for i in 1 ... n {
    var input = readLine()!.split(separator: " ").map { Int($0)! }
    input.removeLast()

    times[i] = input[0]

    for j in 1 ..< input.count {
        line[i] += 1
        preBuild[input[j]].append(i)
    }
}

var queue = Queue<Int>()

for i in 1 ... n {
    if line[i] == 0 {
        queue.enqueue(i)
    }
    
    DP[i] += times[i]
}

var index = 0

while !queue.isEmpty {
    let now = queue.dequeue()!
    
    for i in 0 ..< preBuild[now].count {
        let next = preBuild[now][i]
        
        DP[next] = max(DP[next], DP[now] + times[next])
        
        line[next] -= 1
        
        if line[next] == 0 {
            queue.enqueue(next)
        }
    }
    
    index += 1
}

DP.removeFirst()

for d in DP {
    print(d)
}
