import Foundation


func getPriority(_ operators: [String]) -> [[String]] {
    var result = [[String]]()
    let n = operators.count
    var visited = Array(repeating: false, count: n )
    var temp = [String]()
    
    func permutations() {
        if temp.count == n {
            result.append(temp)
            return
        }
        
        for i in 0 ..< n {
            if visited[i] {
                continue
            }
            
            visited[i] = true
            temp.append(operators[i])
            
            permutations()
            
            visited[i] = false
            temp.removeLast()
        }
    }
    
    permutations()
    
    return result
}

func solution(_ expression:String) -> Int64 {
    
    var numbers = [Int]()
    var numberString = ""
    var operators = [String]()
    var answer = Set<Int>()
    
    for char in expression {
        if char.isNumber {
            numberString += String(char)
        } else {
            operators.append(String(char))
            numbers.append(Int(numberString)!)
            numberString = ""
        }
    }
    numbers.append(Int(numberString)!)
    
    let options = getPriority(Array(Set(operators)))
    
    for option in options {
        var _numbers = numbers
        var _operators = operators
        
        for op in option {
            while _operators.contains(op) {
                let index = Int(_operators.firstIndex(of: op)!)
                var result = 0
                
                switch op {
                case "+":
                    result = _numbers[index] + _numbers[index + 1]
                case "-":
                    result = _numbers[index] - _numbers[index + 1]
                case "*":
                    result = _numbers[index] * _numbers[index + 1]
                default:
                    break
                }
                
                _operators.remove(at: index)
                _numbers.remove(at: index)
                _numbers.insert(result, at: index)
                _numbers.remove(at: index + 1)
            }
        }
        answer.insert(abs(_numbers[0]))
    }
        
    return Int64(answer.max()!)
}
