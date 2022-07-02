//
//  heap.swift
//  Algorithm
//
//  Created by 장재훈 on 2022/03/17.
//

import Foundation

//struct Heap<T: Comparable> {
//    var heap: [T]
//
//    // maxHeap >, minHeap <
//    var compare: (T, T) -> Bool
//
//    var root: T? {
//        return heap.isEmpty ? nil : heap[0]
//    }
//
//    var isEmpty: Bool {
//        return heap.isEmpty
//    }
//
//    init(compare: @escaping (T, T) -> Bool) {
//        self.heap = []
//        self.compare = compare
//    }
//
//    // 삽입
//    mutating func insert(n: T) {
//        heap.append(n)
//        shiftUp(i: heap.count - 1)
//    }
//
//    // 삭제
//    mutating func delete() -> T? {
//        if heap.isEmpty {
//            return nil
//        }
//
//        if heap.count == 1 {
//            return heap.removeFirst()
//        }
//
//        heap.swapAt(0, heap.count - 1)
//
//        let result = heap.removeLast()
//        shiftDown(i: 0)
//
//        return result
//    }
//
//    // 삽입 시 노드 상승
//    mutating func shiftUp(i: Int) {
//        var now = i
//
//        // 현재 노드가 루트 노드보다 하위 노드일때
//        while now > 0 {
//            // 부모 노드 인덱스
//            let parent = (now - 1) / 2
//
//            // 부모 노드와 대소비교, 교환 필요 시
//            if compare(heap[now], heap[parent]) {
//                heap.swapAt(now, parent)
//                // 교환 후 현재 노드를 원래 부모 노드가 있던 자리로 옮겨줌
//                now = parent
//            } else {
//                break
//            }
//        }
//    }
//
//    // 원소 삭제 시 노드 하강
//    mutating func shiftDown(i: Int) {
//        var now: Int = i
//        // 자식 노드 인덱스
//        var child: Int = 2 * now + 1
//        let count: Int = heap.count
//
//        // 자식 노드가 트리 범위안에 있을때
//        while child < count {
//            // 왼쪽 자식, 오른쪽 자식 둘다 있을때
//            if child + 1 < count {
//                child = compare(heap[child], heap[child + 1]) ? child : child + 1
//            }
//            // 자식 노드와 대소비교 후 교환
//            if compare(heap[child], heap[now]) {
//                heap.swapAt(now, child)
//                now = child // 현재 노드를 자식노드 인덱스로
//                child = 2 * now + 1
//            } else {
//                break
//            }
//        }
//    }
//}

//var heap: Heap = Heap<Int>(sort: >)
//
//struct Heap<T: Comparable> {
//    var nodes: [T] = []
//    let sort: (T,T) -> Bool
//
//    init(sort: @escaping (T,T) -> Bool) {
//        self.sort = sort
//    }
//
//    // Heap에 데이터 추가 (push)
//    mutating func insert(_ element: T) {
//        let count = nodes.count
//        nodes.append(element)
//
//        up(count - 1)
//    }
//
//    // Heap에서 데이터 꺼내면서 삭제 (pop)
//    mutating func delete() -> T? {
//        if nodes.isEmpty {
//            return nil
//        }
//        if nodes.count == 1 {
//            return nodes.removeFirst()
//        }
//        nodes.swapAt(0, nodes.count - 1)
//
//        let result = nodes.removeLast()
//        down(0)
//
//        return result
//    }
//
//    // Heap에서 특정 데이터 삭제
//    mutating func remove(_ element: T) {
//        if let index = nodes.firstIndex(of: element) {
//            nodes.swapAt(index, nodes.count - 1)
//            nodes.removeLast()
//            up(index)
//            down(index)
//        }
//    }
//
//    // Heap에서 데이터 전체 삭제
//    mutating func removeAll(_ element: T) {
//        var count = nodes.count
//        remove(element)
//        while nodes.count < count {
//            remove(element)
//            count = nodes.count
//        }
//    }
//
//    // Heap에서 첫 데이터 pop
//    func peek() -> T? {
//        return nodes.first
//    }
//
//    // Heap 데이터 아래방향으로 비교 정렬
//    mutating func down(_ index: Int) {
//        var index = index
//        let count = nodes.count
//        while 2 * index + 1 < count {
//            var i = 2 * index + 1
//            if i < (count - 1) && sort(nodes[i], nodes[i + 1]) {
//                i += 1
//            }
//            if !sort(nodes[index], nodes[i]) {
//                break
//            }
//            nodes.swapAt(index, i)
//            index = i
//        }
//    }
//
//    // Heap 데이터 윗방향으로 비교 정렬
//    mutating func up(_ index: Int) {
//        var index = index
//        while index > 0 && !sort(nodes[(index - 1) / 2], nodes[index]) {
//            nodes.swapAt((index - 1) / 2, index)
//            index = (index - 1) / 2
//        }
//    }
//}
