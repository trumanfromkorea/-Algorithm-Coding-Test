import Foundation

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
