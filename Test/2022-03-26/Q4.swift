import Foundation

func solution(_ _arr: [Int], _ _brr: [Int]) -> Int {
    
    var arr = _arr
    let brr = _brr
    var answer = 0
    
    for i in 0 ..< arr.count - 1 {
        if arr[i] == brr[i] {
            continue
        }
        else if arr[i] < brr[i] {
            while arr[i] != brr[i] {
                arr[i] += 1
                arr[i+1] -= 1
            }
            answer += 1
        }
        else if arr[i] > brr[i] {
            while arr[i] != brr[i] {
                arr[i] -= 1
                arr[i+1] += 1
            }
            answer += 1
        }
        
    }
    
    return answer
}

