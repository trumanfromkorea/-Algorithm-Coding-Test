//
//  queue.swift
//  Algorithm
//
//  Created by 장재훈 on 2022/01/12.
//

import Foundation

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

//// 스택 두개로 구현한 큐
//struct DoubleStackQueue<T> {
//    var inbox: [T] = []
//    var outbox: [T] = []
//
//    var isEmpty: Bool {
//        return inbox.isEmpty && outbox.isEmpty
//    }
//
//    var count: Int {
//        return inbox.count + outbox.count
//    }
//
//    var front: T? {
//        return outbox.last ?? inbox.first
//    }
//
//    mutating func enqueue(_ input: T) {
//        inbox.append(input)
//    }
//    
//    @discardableResult
//    mutating func dequeue() -> T? {
//        if outbox.isEmpty {
//            outbox = inbox.reversed()
//            inbox.removeAll()
//        }
//        return outbox.popLast()
//    }
//    
//    mutating func clear() {
//        outbox.removeAll()
//        inbox.removeAll()
//    }
//
//    func printQueue() {
//        var output = ""
//
//        if isEmpty {
//            print("Queue is Empty")
//            return
//        }
//
//        for o in outbox.reversed() {
//            output += "\(o) "
//        }
//        
//        for i in inbox {
//            output += "\(i) "
//        }
//        
//        print(output)
//    }
//}

// 덱 자료구조 (양방향 큐)
struct Deque<T> {
    var leftBox: [T] = []
    var rightBox: [T] = []

    var isEmpty: Bool {
        return leftBox.isEmpty && rightBox.isEmpty
    }

    var count: Int {
        return leftBox.count + rightBox.count
    }

    mutating func appendFirst(_ input: T) {
        leftBox.append(input)
    }

    mutating func appendLast(_ input: T) {
        rightBox.append(input)
    }
    
    @discardableResult
    mutating func popFirst() -> T? {
        if leftBox.isEmpty {
            leftBox = rightBox.reversed()
            rightBox.removeAll()
        }

        return leftBox.popLast()
    }

    @discardableResult
    mutating func popLast() -> T? {
        if rightBox.isEmpty {
            rightBox = leftBox.reversed()
            leftBox.removeAll()
        }

        return rightBox.popLast()
    }

    func printDeque() {
        var output = ""

        for l in leftBox.reversed() {
            output += "\(l) "
        }

        for r in rightBox {
            output += "\(r) "
        }

        print(output)
    }
}
