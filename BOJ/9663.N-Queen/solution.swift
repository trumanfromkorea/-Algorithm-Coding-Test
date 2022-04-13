import Foundation

// MARK: - 실행

let n = Int(readLine()!)!

var points: [Int] = []

var answer = 0

findPoint(0)

print(answer)

// MARK: - 선언

func findPoint(_ index: Int) {
    if index == n {
        answer += 1
        return
    }

    for i in 0 ..< n {
        if points.contains(i) {
            continue
        } else if isDiagonal(i) {
            continue
        }

        points.append(i)

        findPoint(index + 1)

        points.removeLast()
    }
}

func isDiagonal(_ x: Int) -> Bool {
    for i in 0 ..< points.count {
        if abs(points.count - i) == abs(x - points[i]) {
            return true
        }
    }
    return false
}