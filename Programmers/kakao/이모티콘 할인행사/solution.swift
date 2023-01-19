import Foundation

func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
    let salesRates = [10, 20, 30, 40]

    var maxEmoticonPlus = 0
    var maxSales = 0

    func calculate(rateCases: [Int]) {
        var emoticonPlus = 0
        var sales = 0

        for i in 0 ..< users.count {
            var salesSum = 0

            let user = users[i]
            let userRate = user[0]
            let userMaxValue = user[1]

            for j in 0 ..< rateCases.count {
                if userRate > rateCases[j] {
                    continue
                }

                salesSum += Int((100.0 - Double(rateCases[j])) * (Double(emoticons[j])) / 100.0)
            }

            if salesSum >= userMaxValue {
                emoticonPlus += 1
            } else {
                sales += salesSum
            }
        }

        if maxEmoticonPlus > emoticonPlus {
            return
        }

        if maxEmoticonPlus == emoticonPlus && maxSales >= sales {
            return
        }

        maxEmoticonPlus = emoticonPlus
        maxSales = sales
    }

    func dfs(rateCase: inout [Int]) {
        if rateCase.count == emoticons.count {
            calculate(rateCases: rateCase)
            return
        }

        for i in 0 ..< salesRates.count {
            rateCase.append(salesRates[i])
            dfs(rateCase: &rateCase)
            rateCase.removeLast()
        }
    }

    var rateCase: [Int] = []
    dfs(rateCase: &rateCase)

    return [maxEmoticonPlus, maxSales]
}