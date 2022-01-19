// 백준 - 가운데를 말해요
import Foundation

struct Heap<T> {
    var heap: [T]
    var compare: (T, T) -> Bool

    var root: T? {
        if heap.isEmpty {
            return nil
        } else {
            return heap[0]
        }
    }

    mutating func shiftUp(i: Int) {
        var now = i

        while now > 0 {
            let parent = (now - 1) / 2

            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                now = parent
            } else {
                break
            }
        }
    }

    mutating func shiftDown(i: Int) {
        var now = i
        var child = 2 * i + 1
        let count = heap.count

        while child < count {
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }
            if compare(heap[child], heap[now]) {
                heap.swapAt(now, child)
                now = child
                child = 2 * now + 1
            } else {
                break
            }
        }
    }

    mutating func insert(n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
    }

    init(heap: [T] = [], compare: @escaping (T, T) -> Bool) {
        self.heap = heap
        self.compare = compare
    }
}

var maxHeap = Heap<Int> { $0 > $1 }
var minHeap = Heap<Int> { $0 < $1 }

let n = Int(readLine()!)!
var answer = ""

if n == 1 {
    print(Int(readLine()!)!)
} else {
    maxHeap.insert(n: Int(readLine()!)!)
    answer += "\(maxHeap.root!)\n"

    for i in 2 ... n {
        let input = Int(readLine()!)!

        if i % 2 == 0 {
            minHeap.insert(n: input)
        } else {
            maxHeap.insert(n: input)
        }

        let a = maxHeap.root!
        let b = minHeap.root!

        if a > b {
            minHeap.heap[0] = a
            maxHeap.heap[0] = b
        }

        if i % 2 == 0 { maxHeap.shiftDown(i: 0) }
        else { minHeap.shiftDown(i: 0) }

        answer += "\(maxHeap.root!)\n"
    }

    print(answer)
}
