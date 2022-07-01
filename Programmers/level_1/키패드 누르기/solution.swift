import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    
    var answer = ""
    
    var leftHand = 10
    var rightHand = 12
    
    let leftSet: Set<Int> = [1,4,7]
    let rightSet: Set<Int> = [3,6,9]
    let midSet: Set<Int> = [2,5,8,11]
    
    for num in numbers {
        var number = num
        if num == 0 {
            number = 11
        }
        
        if leftSet.contains(number) {
            answer += "L"
            leftHand = number
        } else if rightSet.contains(number) {
            answer += "R"
            rightHand = number
        } else if midSet.contains(number) {
            let numberRow = (number - 1) / 3
            
            var leftRow = (leftHand - 1) / 3
            var leftCol = (leftHand + 2) % 3
            var leftDist = abs(numberRow - leftRow) + abs(leftCol - 1)
            
            var rightRow = (rightHand - 1) / 3 // 3
            var rightCol = (rightHand + 2) % 3 // 2
            var rightDist = abs(numberRow - rightRow) + abs(rightCol - 1)
            
            
            if rightDist > leftDist {
                answer +=  "L"
                leftHand = number
            } else if rightDist < leftDist {
                answer +=  "R"
                rightHand = number
            } else {
                
                if hand == "right" {
                    answer += "R"
                    rightHand = number
                } else {
                    answer += "L"
                    leftHand = number
                }
            }
        }
    }
    
    return answer
}
