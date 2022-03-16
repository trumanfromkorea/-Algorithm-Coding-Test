// 인접리스트로 구현되었을때 다익스트라

struct Node: Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        lhs.cost > rhs.cost
    }

    var to: Int
    var cost: Int
}

func dijkstra(start: Int) -> [Int] {
    var distances: [Int] = []
    var pQueue = Heap<Node>(compare: >) // maxHeap
    
    pQueue.insert(n: Node(to: start, cost: 0))

    for i in 0 ..< n {
        distances.append(start == i ? 0 : Int.max)
    }

    while !pQueue.isEmpty {
        let popped = pQueue.delete()!
        
        if distances[popped.to] < popped.cost {
            continue
        }
        
        for node in graph[popped.to] {
            let dist = node.cost + popped.cost
            
            if dist < distances[node.to] {
                distances[node.to] = dist
                pQueue.insert(n: Node(to: node.to, cost: dist))
            }
        }
    }
    
    return distances
}
