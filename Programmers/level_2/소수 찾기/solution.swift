import Foundation

func solution(_ numbers: String) -> Int {
    
    var numberArray = numbers.map { String($0) }
    let length = numberArray.count
    var visited = Array(repeating: false, count: length)
    var tempArray = [String]()
    var permuted = Set<Int>()
    var answer = 0
    
    func permutations(_ count: Int) {
        if tempArray.count == count {
            let number = Int(tempArray.joined(separator: ""))!
            permuted.insert(number)
            return
        }
        
        for i in 0 ..< length {
            if visited[i] {
                continue
            }
            
            visited[i] = true
            tempArray.append(numberArray[i])
            
            permutations(count)
            
            visited[i] = false
            tempArray.removeLast()
        }
    }
    
    for i in 1 ... length {
        permutations(i)
    }
    
    for number in Array(permuted) {
        if isPrime(number) {
            answer += 1
        }
    }
    
    
    return answer
}

func isPrime(_ number: Int) -> Bool {
    if number <= 1 {
        return false
    } else if number <= 3  {
        return true
    }
    
    let num = Int(sqrt(Double(number)))

    for i in 2 ... num{
        if number % i == 0 {
            return false
        }
    }
    
    return true
}