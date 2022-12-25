import Foundation

func getClockNum(_ numbers: [Int]) -> Int {
    var result = Int.max

    for i in 0 ..< 4 {
        let candidate = Int("\(numbers[i % 4])\(numbers[(i + 1) % 4])\(numbers[(i + 2) % 4])\(numbers[(i + 3) % 4])")!
        result = min(result, candidate)
    }

    return result
}

func isClockNum(_ number: Int) -> Bool {
    let numbers = "\(number)".map { Int(String($0))! }

    return number == getClockNum(numbers)
}

let array = readLine()!.split(separator: " ").map { Int($0)! }
let clockNumber = getClockNum(array)

let answer = Array(1111 ... 9999).filter { isClockNum($0) }.firstIndex(of: clockNumber)! + 1

print(answer)
