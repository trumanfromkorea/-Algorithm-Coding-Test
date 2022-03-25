import Foundation

func solution(_ maps: [String]) -> [Int] {
    var answerSet: Set<Int> = []

    let map: [[Int]] = generateMap(maps)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)

    for i in 0 ..< map.count {
        for j in 0 ..< map[0].count {
            if !visited[i][j] {
                let result = searchMap(map, &visited, Point(i: i, j: j))
                answerSet.insert(result)
            }
        }
    }

    var answer = Array(answerSet).sorted()
    answer.removeFirst()

    return answer
}

// 문자열 배열 -> 정수 2차원 배열
func generateMap(_ maps: [String]) -> [[Int]] {
    var newMap: [[Int]] = []

    for m in maps {
        let line = m.map { Int(String($0))! }
        newMap.append(line)
    }

    return newMap
}

// 탐색
func searchMap(_ map: [[Int]], _ visited: inout [[Bool]], _ start: Point) -> Int {
    var area = 0

    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]

    var queue: Queue = Queue<Point>()

    if map[start.i][start.j] == 0 {
        return 0
    }

    area += 1
    queue.enqueue(start)

    while !queue.isEmpty {
        let now = queue.dequeue()!
        visited[now.i][now.j] = true

        if map[now.i][now.j] == 1 && !visited[now.i][now.j] {
            area += 1
        }

        for i in 0 ..< 4 {
            let ni = now.i + dx[i]
            let nj = now.j + dy[i]

            if !isInBound(ni, nj, map) || visited[ni][nj] || map[ni][nj] == 0 {
                continue
            }

            queue.enqueue(Point(i: ni, j: nj))
            visited[ni][nj] = true

            if map[ni][nj] == 1 {
                area += 1
            }
        }
    }

    return area
}

// 범위 확인
func isInBound(_ i: Int, _ j: Int, _ map: [[Int]]) -> Bool {
    return map.count > i && i >= 0 && map[0].count > j && j >= 0
}

struct Point {
    var i: Int
    var j: Int
}

// 큐
struct Queue<T> {
    private var queue: [T] = []

    public var count: Int {
        return queue.count
    }

    public var isEmpty: Bool {
        return queue.isEmpty
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }

    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }

    public mutating func clear() {
        queue.removeAll()
    }
}
