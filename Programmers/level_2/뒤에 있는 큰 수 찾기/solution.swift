import Foundation

func solution(_ numbers: [Int]) -> [Int] {
    var stack: [Int] = []
    var answer = Array(repeating: -1, count: numbers.count)
    
    for i in 0 ..< numbers.count {
        while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
            let index = stack.removeLast()
            answer[index] = numbers[i]
        }
        stack.append(i)
    }
    
    return answer
}
