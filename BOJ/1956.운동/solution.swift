import Foundation

let INF = 400 * 100000
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (v, e) = (input[0], input[1])

var graph = Array(repeating: Array(repeating: INF, count: v), count: v)

for _ in 0 ..< e {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (i, j, w) = (info[0] - 1, info[1] - 1, info[2])

    graph[i][j] = w
}

for k in 0 ..< v {
    for i in 0 ..< v {
        for j in 0 ..< v {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

var answer = INF

for i in 0 ..< v {
    answer = min(answer, graph[i][i])
}

print(answer == INF ? -1 : answer)
