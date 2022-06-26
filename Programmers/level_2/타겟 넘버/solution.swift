import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    var answer = 0
    
    func DFS(_ value: Int, _ index: Int) { 
        if index == numbers.count {
            if value == target {
                answer += 1
            }
            return
        }
        
        DFS(value + numbers[index], index + 1)
        DFS(value - numbers[index], index + 1)
    }
    
    DFS(numbers.first!, 1)
    DFS(numbers.first! * (-1), 1)
    
    return answer
}