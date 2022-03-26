import Foundation

func solution(_ sentences: [String], _ n: Int) -> Int {
    var keys: Set<String> = []
    var scores: [Set<String>: Int] = [:]

    for sen in sentences {
        var score = sen.count

        let upperCount = upperCaseCount(sen)

        if upperCount > 0 {
            keys.insert("shift") // shift 키
            score += upperCount
        }

        for c in sen {
            if c != " " {
                keys.insert(String(c).lowercased())
            }
        }

        if scores[keys] == nil {
            scores[keys] = score
        } else {
            scores[keys]! += score
        }
        
        if keys.count > n {
            return 0
        }

        keys.removeAll()
    }
    
    for (keyI, valI) in scores {
        for keyJ in scores.keys {
            if keyI == keyJ {
                continue
            }
            
            if keyI.isSubset(of: keyJ) {
                scores[keyJ]! += valI
                scores[keyI] = nil
            }
        }
    }

    return scores.values.max()!
}

// 대문자 포함하는지
func upperCaseCount(_ sentence: String) -> Int {
    var count = 0

    for c in sentence {
        if c >= "A" && c <= "Z" {
            count += 1
        }
    }

    return count
}


