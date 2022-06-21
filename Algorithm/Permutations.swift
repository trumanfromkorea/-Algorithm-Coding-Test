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
