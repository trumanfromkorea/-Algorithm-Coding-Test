import Foundation

// MARK: - 구현부

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let (vA, vB, rA, rB) = (input[0], input[1], input[2], input[3])

var visited: [Bottle: Int] = [:]

print(BFS(Bottle(a: 0, b: 0)))

// MARK: - 선언부

struct Bottle: Hashable {
    var a: Int
    var b: Int
}

func checkVisited(_ now: Bottle, _ comp: Bottle, _ queue: inout Queue<Bottle>) {
    if visited[comp] == nil {
        queue.enqueue(comp)
        visited[comp] = visited[now]! + 1
    }
}

func BFS(_ bottle: Bottle) -> Int {
    var queue: Queue<Bottle> = Queue()

    visited[bottle] = 0
    queue.enqueue(bottle)

    if rA == 0 && rB == 0 {
        return 0
    }

    while !queue.isEmpty {
        let now: Bottle = queue.dequeue()!
        var comp: Bottle

        // A 채우기
        comp = Bottle(a: vA, b: now.b)
        checkVisited(now, comp, &queue)

        // B 채우기
        comp = Bottle(a: now.a, b: vB)
        checkVisited(now, comp, &queue)

        // A 비우기
        comp = Bottle(a: 0, b: now.b)
        checkVisited(now, comp, &queue)

        // B 비우기
        comp = Bottle(a: now.a, b: 0)
        checkVisited(now, comp, &queue)

        // A -> B
        if now.a <= vB - now.b {
            comp = Bottle(a: 0, b: now.a + now.b)
            checkVisited(now, comp, &queue)
        } else {
            comp = Bottle(a: now.a + now.b - vB, b: vB)
            checkVisited(now, comp, &queue)
        }

        // B -> A
        if now.b <= vA - now.a {
            comp = Bottle(a: now.a + now.b, b: 0)
            checkVisited(now, comp, &queue)
        } else {
            comp = Bottle(a: vA, b: now.a + now.b - vA)
            checkVisited(now, comp, &queue)
        }
    }

    let result: Int? = visited[Bottle(a: rA, b: rB)]

    return result != nil ? result! : -1
}
