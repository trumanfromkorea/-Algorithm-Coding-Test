import Foundation

let string = readLine()!

var deque = Deque<String>()
var tag = Deque<String>()
var answer = ""

for char in string {
    
    let c = String(char)
    
    if c == " " {
        if !tag.isEmpty {
            tag.appendLast(c)
            continue
        }
        
        while !deque.isEmpty {
            answer += deque.popLast()!
        }
        answer += " "
    }
    else if c == "<" {
        while !deque.isEmpty {
            answer += deque.popLast()!
        }
        tag.appendLast(c)
    }
    else if c == ">" {
        tag.appendLast(c)
        while !tag.isEmpty {
            answer += tag.popFirst()!
        }
    } else {
        if !tag.isEmpty {
            tag.appendLast(c)
        } else {
            deque.appendLast(c)
        }
    }
}

while !deque.isEmpty {
    answer += deque.popLast()!
}

print(answer)

struct Deque<T> {
    var leftBox: [T] = []
    var rightBox: [T] = []

    var isEmpty: Bool {
        return leftBox.isEmpty && rightBox.isEmpty
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
}
