import Foundation

// MARK: - 구현부

var answer: String = ""

let n: Int = Int(readLine()!)!

var tree: [[Int]] = Array(repeating: [], count: n)
var parent: [Int] = Array(repeating: 0, count: n)

var nodes: [Node] = Array(repeating: Node(parent: 0, depth: 0), count: n)
var visited: [Bool] = Array(repeating: false, count: n)

for _ in 0 ..< n - 1 {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

    tree[input[0]].append(input[1])
    tree[input[1]].append(input[0])
}

DFS(0)

let m: Int = Int(readLine()!)!

for _ in 0 ..< m {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }

    findParent(input[0], input[1])
}

print(answer)

// MARK: - 선언부

struct Node {
    var parent: Int
    var depth: Int
}

func DFS(_ now: Int) {
    visited[now] = true

    for child in tree[now] {
        if !visited[child] {
            parent[child] = now + 1
            nodes[child].parent = now + 1
            nodes[child].depth = nodes[now].depth + 1
            DFS(child)
        }
    }
}

func equalizeDepth(_ i: Int, _ j: Int) -> (Int, Int) {
    var a: Int = i
    var b: Int = j

    if nodes[a].depth < nodes[b].depth {
        while nodes[a].depth < nodes[b].depth {
            b = nodes[b].parent - 1
        }
    } else if nodes[a].depth > nodes[b].depth {
        while nodes[a].depth > nodes[b].depth {
            a = nodes[a].parent - 1
        }
    }
    
    return (a, b)
}

func findParent(_ i: Int, _ j: Int) {
    var (a, b) = equalizeDepth(i, j)
    
    if a == b {
        answer += "\(a + 1)\n"
        return
    }
    
    while nodes[a].parent != nodes[b].parent {
        a = nodes[a].parent - 1
        b = nodes[b].parent - 1
    }
    
    answer += "\(nodes[a].parent)\n"
}
