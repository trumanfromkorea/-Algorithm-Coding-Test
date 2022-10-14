func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
    var answer: [String] = []

    for (num1, num2) in zip(arr1, arr2) {
        var result = ""
        
        let bin1 = expand(bin: String(num1, radix: 2), n: n)
        let bin2 = expand(bin: String(num2, radix: 2), n: n)
        
        for (item1, item2) in zip(bin1, bin2) {
            if String(item1) == "0" && String(item2) == "0" {
                result += " "
            } else {
                result += "#"
            }
        }
        
        answer.append(result)
    }

    return answer
}

func expand(bin: String, n: Int) -> String {
    var result = bin
    
    for _ in 0 ..< n - bin.count {
        result = "0" + result
    }
    
    return result
}

