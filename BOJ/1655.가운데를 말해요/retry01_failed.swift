//
//  main.swift
//  project
//
//  Created by 장재훈 on 2022/01/20.
//

import Foundation

struct Heap<T: Comparable> {
    var heap: [T]
    var compare: (T, T) -> Bool

    var root: T? {
        if heap.isEmpty {
            return nil
        } else {
            return heap[0]
        }
    }

    init(heap: [T] = [], compare: @escaping (T, T) -> Bool) {
        self.heap = heap
        self.compare = compare
    }

    mutating func insert(input: T) {
        heap.append(input)
        shiftUp(index: heap.count - 1)
    }

    mutating func shiftUp(index: Int) {
        var now: Int = index
  
        while now > 0 {
            let parent: Int = (now - 1) / 2

            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                now = parent
            } else {
                break
            }
        }
    }

    mutating func shiftDown(index: Int) {
        var now: Int = index
        var child: Int = now * 2 + 1
        let count: Int = heap.count

        while child < count {
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }

            if !compare(heap[now], heap[child]) {
                break
            } else {
                heap.swapAt(now, child)
                now = child
                child = now * 2 + 1
            }
        }
    }
}

var maxHeap: Heap<Int> = Heap(compare: >)
var minHeap: Heap<Int> = Heap(compare: <)

var answer: String = ""

let n = Int(readLine()!)!

maxHeap.insert(input: Int(readLine()!)!)
answer += "\(maxHeap.root!)\n"

for i in 2 ... n {
    let input = Int(readLine()!)!

    if i % 2 != 0 {
        maxHeap.insert(input: input)
    } else {
        minHeap.insert(input: input)
    }

    print(maxHeap.heap)
    print(minHeap.heap)

    if minHeap.heap.isEmpty {
        answer += "\(input)\n"
        continue
    }

    let maxRoot: Int = maxHeap.root!
    let minRoot: Int = minHeap.root!

    if maxRoot > minRoot {
        maxHeap.heap[0] = minRoot
        minHeap.heap[0] = maxRoot
    }

    i % 2 != 0 ? minHeap.shiftDown(index: 0) : maxHeap.shiftDown(index: 0)

    answer += "\(maxHeap.root!)\n"
}

print(answer)
