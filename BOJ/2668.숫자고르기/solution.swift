import Foundation

// MARK: - 실행

let n = Int(readLine()!)!

var array: [Int] = [-1]
var temp: [Int] = []

var answer: [Int] = []

getArray()
solution()


// MARK: - 선언

func getArray() {
    for _ in 0 ..< n {
        array.append(Int(readLine()!)!)
    }
}

func DFS(_ index: Int) -> Int{
    if temp.contains(index) {
        return index
    }
    
    temp.append(index)
    
    return DFS(array[index])
}

func solution() {
    for i in 1 ... n {
        temp.removeAll()
        
        if DFS(i) == i {
            answer.append(i)
        }
    }
    
    print(answer.count)
    for item in answer {
        print(item)
    }
}
