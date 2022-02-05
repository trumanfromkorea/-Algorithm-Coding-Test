import Foundation

var n: Int = Int(readLine()!)!
var answer: Int = 0

for _ in 0 ..< n {
    var isGroupWord: Bool = true
    var recentWord: String = ""
    var charList: [String] = []
    
    let word: String = readLine()!
    
    for w in word {
        if !charList.contains(String(w)) {
            charList.append(String(w))
            recentWord = String(w)
        } else {
            if recentWord != String(w){
                isGroupWord = false
                break
            }
        }
    }
    
    answer += isGroupWord ? 1 : 0
}

print(answer)
