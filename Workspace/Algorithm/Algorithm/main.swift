import Foundation

func permutations<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    let count = array.count

    if count < n {
        return result
    }

    var visited = Array(repeating: false, count: count)

    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0 ..< count {
            if visited[i] {
                continue
            }

            visited[i] = true
            cycle(now + [array[i]])
            visited[i] = false
        }
    }

    cycle([])

    return result
}

func combinations<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    let count = array.count

    if count < n {
        return result
    }

    func cycle(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in index ..< count {
            cycle(i + 1, now + [array[i]])
        }
    }

    cycle(0, [])

    return result
}

let array = [1, 2, 3]
let n = 3

let C = combinations(array, n)
let P = permutations(array, n)

for c in C {
    print(c)
}

print("----------")

for p in P {
    print(p)
}
