import Foundation

solution(5, [[4, 3], [4, 2], [3, 2], [1, 2], [2, 5]])

func solution(_ n: Int, _ results: [[Int]]) -> Int {
    var graph: [[Int]] = Array(repeating: [], count: n)
    var info: [Int: Set<Int>] = [:]

    var visited: [Bool] = Array(repeating: false, count: n)
    var certified: Set<Int> = Set<Int>()

    for i in 0 ..< n {
        info[i] = Set<Int>()
    }

    for result in results {
        let i = result[0] - 1
        graph[i].append(result[1] - 1)
    }

    func DFS(_ x: Int, _ start: Int) {
        visited[x] = true
        info[start]?.insert(x)
        info[x]?.insert(start)

        if graph[x].isEmpty {
            return
        }

        for i in 0 ..< graph[x].count {
            let next = graph[x][i]
            if visited[next] { continue }
            DFS(next, start)
        }
    }

    for i in 0 ..< n {
        visited = Array(repeating: false, count: n)
        DFS(i, i)
    }

    for i in 0 ..< n {
        if info[i]?.count == n {
            certified.insert(i)
            continue
        }

        var count = 0
        for j in 0 ..< n {
            if i != j {
                if info[j]!.contains(i) {
                    count += 1
                }
            }
        }
        print(i, count)
        if count == n - 1 {
            certified.insert(i)
        }
    }

    return certified.count
}
