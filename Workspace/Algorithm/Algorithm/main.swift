import Foundation

func solution(_ s: String) -> Int {
    if s.count < 3 { return s.count }

    var result: Int = s.count

    for length in 1 ... s.count / 2 {
        let slicedString = sliceString(s, length)
        let compressedString = compressString(slicedString)
        let length = compressedString.count
        result = min(result, length)
    }

    return result
}

func sliceString(_ str: String, _ length: Int) -> [String] {
    var result: [String] = []
    var temp = ""

    for s in str {
        temp += String(s)
        if temp.count >= length {
            result.append(temp)
            temp = ""
        }
    }

    if !temp.isEmpty {
        result.append(temp)
    }
    return result
}

func compressString(_ array: [String]) -> String {
    var result: String = ""
    var temp: String = ""
    var count: Int = 1
    
    for str in array {
        if temp == str {
            count += 1
            continue
        }
        
        if !temp.isEmpty {
            result += count > 1 ? "\(count)\(temp)" : temp
        }
        temp = str
        count = 1
    }
    
    if !temp.isEmpty {
        result += count > 1 ? "\(count)\(temp)" : temp
    }
    return result
}
