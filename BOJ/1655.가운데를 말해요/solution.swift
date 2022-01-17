// 백준 - 가운데를 말해요
import Foundation

var myMaxHeap = Heap<Int>([], isMaxHeap: true)
var myMinHeap = Heap<Int>([], isMaxHeap: false)

let n: Int = Int(readLine()!)!
var answers: [Int] = []

for _ in 0 ..< n {
    let input: Int = Int(readLine()!)!

    if myMaxHeap.count == myMinHeap.count {
        myMaxHeap.push(input)
    } else {
        myMinHeap.push(input)
    }

    let isEmpty: Bool = myMaxHeap.isEmpty || myMinHeap.isEmpty ? true : false

    if !isEmpty && myMaxHeap.root! > myMinHeap.root! {
        let max = myMaxHeap.popRoot()!
        let min = myMinHeap.popRoot()!

        myMaxHeap.push(min)
        myMinHeap.push(max)
    }

    answers.append(myMaxHeap.root!)
}

//myMaxHeap.printHeap()
//myMinHeap.printHeap()
//
//print(answers)

 for i in 0 ..< n {
    print(answers[i])
 }

class Heap<T: Comparable> {
    var heapArray: [T]

    var root: T? {
        if isMaxHeap {
            maxHeapify()
        } else {
            minHeapify()
        }
        return heapArray.first
    }

    var count: Int {
        return heapArray.count
    }

    var isEmpty: Bool {
        return heapArray.isEmpty
    }

    var isMaxHeap: Bool

    init(_ n: [T], isMaxHeap: Bool) {
        heapArray = n
        self.isMaxHeap = isMaxHeap
    }

    func hasLeftChild(_ parent: Int) -> Bool {
        if parent * 2 + 1 >= count {
            return false
        } else {
            return true
        }
    }

    func hasRightChild(_ parent: Int) -> Bool {
        if parent * 2 + 2 >= count {
            return false
        } else {
            return true
        }
    }

    func parentIndex(_ child: Int) -> Int { return child / 2 }
    func leftChildIndex(_ parent: Int) -> Int { return parent * 2 + 1 }
    func rightChildIndex(_ parent: Int) -> Int { return parent * 2 + 2 }

    func printHeap() {
        print(heapArray)
    }

    func maxHeapify() {
        isMaxHeap = true
        var i = count / 2

        while i >= 0 {
            var bigChild: Int = 0

            if hasLeftChild(i) && hasRightChild(i) {
                if heapArray[leftChildIndex(i)] <= heapArray[rightChildIndex(i)] {
                    bigChild = rightChildIndex(i)
                } else {
                    bigChild = leftChildIndex(i)
                }

            } else if hasLeftChild(i) && !hasRightChild(i) {
                bigChild = leftChildIndex(i)
            } else if !hasLeftChild(i) && hasRightChild(i) {
                i -= 1
                continue
            }

            if heapArray[bigChild] >= heapArray[i] {
                heapArray.swapAt(bigChild, i)
            }
            i -= 1
        }
    }

    func minHeapify() {
        isMaxHeap = false
        var i = count / 2
        while i >= 0 {
            var smallChild: Int = 0

            if hasLeftChild(i) && hasRightChild(i) {
                if heapArray[leftChildIndex(i)] >= heapArray[rightChildIndex(i)] {
                    smallChild = rightChildIndex(i)
                } else {
                    smallChild = leftChildIndex(i)
                }

            } else if hasLeftChild(i) && !hasRightChild(i) {
                smallChild = leftChildIndex(i)
            } else if !hasLeftChild(i) && hasRightChild(i) {
                i -= 1
                continue
            }

            if heapArray[smallChild] <= heapArray[i] {
                heapArray.swapAt(smallChild, i)
            }
            i -= 1
        }
    }

    func popRoot() -> T? {
        isMaxHeap ? maxHeapify() : minHeapify()

        if !heapArray.isEmpty {
            heapArray.swapAt(heapArray.count - 1, 0)
        }

        let result = heapArray.popLast()
        return result
    }

    func push(_ n: T) {
        heapArray.append(n)
        isMaxHeap ? maxHeapify() : minHeapify()
    }
}
