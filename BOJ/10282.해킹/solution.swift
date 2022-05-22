import Foundation

let cases = Int(readLine()!)!

var (n, d, c) = (0, 0, 0)
var (a, b, s) = (0, 0, 0)
var (count, time) = (0, 0)

var distances: [Int] = []
var edgeList: [[Edge]] = []

for _ in 0 ..< cases {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    (n, d, c) = (info[0], info[1], info[2])

    distances = Array(repeating: Int.max, count: n + 1)
    edgeList = Array(repeating: [], count: n + 1)

    for _ in 0 ..< d {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        (a, b, s) = (line[0], line[1], line[2])

        edgeList[b].append(Edge(vertex: a, cost: s))
    }
    distances[c] = 0
    dijkstra()

    count = 0
    time = 0

    for i in 1 ... n {
        if distances[i] != Int.max {
            count += 1
            time = max(time, distances[i])
        }
    }
    print(count, time)
}

// MARK: 선언

struct Edge: Comparable {
    var vertex: Int
    var cost: Int

    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.cost < rhs.cost
    }
}

func dijkstra() {
    var pq = Heap<Edge>(compare: <)
    pq.insert(n: Edge(vertex: c, cost: 0))

    while !pq.isEmpty {
        let now = pq.delete()!

        let vertex = now.vertex
        let cost = now.cost

        if distances[vertex] < cost {
            continue
        }

        for i in 0 ..< edgeList[vertex].count {
            let V = edgeList[vertex][i].vertex
            let C = edgeList[vertex][i].cost + cost

            if distances[V] > C {
                distances[V] = C
                pq.insert(n: Edge(vertex: V, cost: C))
            }
        }
    }
}
