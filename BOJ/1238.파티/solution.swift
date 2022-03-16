import Foundation

// MARK: - 구현부

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
// 학생 수, 간선 수, 목적지
let (n, m, x) = (input[0], input[1], input[2] - 1)

var graph: [[Node]] = Array(repeating: [], count: n)

var minDists: [Int] = []

for _ in 0 ..< m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }

    let (from, to, cost) = (line[0] - 1, line[1] - 1, line[2])

    graph[from].append(Node( to: to, cost: cost))
}

minDists = dijkstra(start: x)

for i in 0 ..< n {
    let result = dijkstra(start: i)
    minDists[i] += result[x]
}

print(minDists.max()!)

// MARK: - 선언부

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

struct Heap<T: Comparable> {
    var heap: [T]

    // maxHeap >, minHeap <
    var compare: (T, T) -> Bool

    var root: T? {
        return heap.isEmpty ? nil : heap[0]
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }

    init(compare: @escaping (T, T) -> Bool) {
        self.heap = []
        self.compare = compare
    }

    // 삽입
    mutating func insert(n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
    }
    
    // 삭제
    mutating func delete() -> T? {
        if heap.isEmpty {
            return nil
        }
        
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        heap.swapAt(0, heap.count - 1)
        
        let result = heap.removeLast()
        shiftDown(i: 0)
        
        return result
    }
    
    // 삽입 시 노드 상승
    mutating func shiftUp(i: Int) {
        var now = i

        // 현재 노드가 루트 노드보다 하위 노드일때
        while now > 0 {
            // 부모 노드 인덱스
            let parent = (now - 1) / 2

            // 부모 노드와 대소비교, 교환 필요 시
            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                // 교환 후 현재 노드를 원래 부모 노드가 있던 자리로 옮겨줌
                now = parent
            } else {
                break
            }
        }
    }

    // 루트노드 값 제자리 찾기 (원래 원소 삭제 시 많이 쓰임)
    mutating func shiftDown(i: Int) {
        var now: Int = i
        // 자식 노드 인덱스
        var child: Int = 2 * now + 1
        let count: Int = heap.count

        // 자식 노드가 트리 범위안에 있을때
        while child < count {
            // 왼쪽 자식, 오른쪽 자식 둘다 있을때
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }
            // 자식 노드와 대소비교 후 교환
            if compare(heap[child], heap[now]) {
                heap.swapAt(now, child)
                now = child // 현재 노드를 자식노드 인덱스로
                child = 2 * now + 1
            } else {
                break
            }
        }
    }
}
