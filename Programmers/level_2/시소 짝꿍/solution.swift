import Foundation

func solution(_ weights: [Int]) -> Int64 {
    let distances = [(2, 3), (2, 4), (3, 4)]
    var answer = 0

    let countDict = weights.reduce(into: [:]) { dict, weight in
        dict[weight, default: 0] += 1
    }

    countDict.values.forEach {
        if $0 > 1 {
            answer += Array(1 ..< $0).reduce(0, +)
        }
    }

    let uniqueWeights = Array(Set(weights))

    for i in 0 ..< uniqueWeights.count {
        for (multiplier, divider) in distances {
            let weight = uniqueWeights[i]
            
            if (weight * multiplier) % divider != 0 {
                continue
            }

            let ratio = (weight * multiplier) / divider

            if let number1 = countDict[ratio],
               let number2 = countDict[weight] {
                answer += number1 * number2
            }
        }
    }

    return Int64(answer)
}
