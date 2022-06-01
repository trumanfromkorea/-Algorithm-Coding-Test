import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, s) = (input[0], input[1])

let array = readLine()!.split(separator: " ").map { Int(String($0))! }

var start = 0
var end = 0

var sum = array[0]
var length = Int.max

while start <= end && end < n  {
    
    if sum < s {
        end += 1
        
        if end == n {
            break
        }
        
        sum += array[end]
    } else if sum >= s {
        length = min(length, end - start + 1)
        
        sum -= array[start]
        start += 1
        
    }
}

print(length == Int.max ? 0 : length)

