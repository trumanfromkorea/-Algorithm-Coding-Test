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
    
    init(compare: @escaping (T, T) -> Bool) {
        heap = []
        self.compare = compare
    }
    
    mutating func insert(n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
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
        var now: Int = i
        var child: Int = 2 * now + 1
        let count: Int = heap.count

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

}

var maxHeap: Heap<Int> = Heap(compare: >)
var minHeap: Heap<Int> = Heap(compare: <)

let n: Int = Int(readLine()!)!
var answer: String = ""

for i in 1 ... n {
    let input: Int = Int(readLine()!)!

    if i % 2 == 0 {
        minHeap.insert(n: input)
    } else {
        maxHeap.insert(n: input)
    }
    
    if minHeap.root == nil {
        answer += "\(maxHeap.root!)\n"
        continue
    }

    let a: Int = maxHeap.root!
    let b: Int = minHeap.root!

    if a > b {
        minHeap.heap[0] = a
        maxHeap.heap[0] = b
    }

    if i % 2 == 0 { maxHeap.shiftDown(i: 0) }
    else { minHeap.shiftDown(i: 0) }

    answer += "\(maxHeap.root!)\n"
}

print(answer)

