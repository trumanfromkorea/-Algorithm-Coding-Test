import Foundation

func DFS(x: Int) {
    visited[x] = true

    for i in 0 ..< n {
        if graph[x][i] == 1 && visited[i] == false {
            DFS(x: i)
        }
    }
}

var answer: Bool = true

var n: Int = Int(readLine()!)!
var m: Int = Int(readLine()!)!

var graph: [[Int]] = []
var plan: [Int] = []
var visited: [Bool] = Array(repeating: false, count: n)

for _ in 0 ..< n {
    graph.append(readLine()!.split(separator: " ").map { Int($0)! })
}

plan = readLine()!.split(separator: " ").map { Int($0)! }

DFS(x: plan[0]-1)

for p in plan {
    if !visited[p-1] {
        answer = false
        break
    }
}

print(answer ? "YES" : "NO")
