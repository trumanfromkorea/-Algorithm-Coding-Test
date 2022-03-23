import Foundation

// MARK: - 구현부

let n: Int = Int(readLine()!)!

var tree: [[Int]] = Array(repeating: [], count: n)
var parent: [Int] = Array(repeating: 0, count: n)
var visited: [Bool] = Array(repeating: false, count: n)

for _ in 0 ..< n - 1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

DFS(0)

for i in 1 ..< n {
    print(parent[i])
}

// MARK: - 선언부

func DFS(_ now: Int) {
    visited[now] = true

    for child in tree[now] {
        if !visited[child] {
            parent[child] = now + 1
            DFS(child)
        }
    }
}
