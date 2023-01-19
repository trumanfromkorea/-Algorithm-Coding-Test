import Foundation

// let users = [[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]]
// let emoticons = [1300, 1500, 1600, 4900]

let users = [[1, 200]]
let emoticons = [200, 100]

// print(solution(users, emoticons))
//
// func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
//    let discounts = [10, 20, 30, 40]
//
//    var serviceCount = 0
//    var sellAmount = 100
//
//    func calculate(array: [Int]) {
//        var service = 0
//        var sell = 0
//
//        for i in 0 ..< users.count {
//            let user = users[i]
//            let ratio = user[0]
//            let maxAmount = user[1]
//
//            var userBuyAmount = 0
//
//            for j in 0 ..< array.count {
//                if array[j] < ratio {
//                    continue
//                }
//
//                let discountAmount = (100.0 - Double(array[j])) / 100.0 * Double(emoticons[j])
//                userBuyAmount += Int(discountAmount)
//            }
//
//            if userBuyAmount >= maxAmount {
//                service += 1
//            } else {
//                sell += userBuyAmount
//            }
//        }
//
//        if service > serviceCount {
//            serviceCount = service
//            sellAmount = sell
//        } else if service == serviceCount {
//            if sell > sellAmount {
//                sellAmount = sell
//            }
//        }
//    }
//
//    func dfs(array: inout [Int], length: Int) {
//        if array.count == length {
//            calculate(array: array)
//            return
//        }
//
//        for i in 0 ..< 4 {
//            array.append(discounts[i])
//            dfs(array: &array, length: length)
//            array.removeLast()
//        }
//    }
//
//    var array: [Int] = []
//    dfs(array: &array, length: emoticons.count)
//
//    return [serviceCount, sellAmount]
// }

// func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
//    let salesRates = [10, 20, 30, 40]
//
//    var maxEmoticonPlus = 0
//    var maxSales = 0
//
//    func calculate(rateCases: [Int]) {
//        var emoticonPlus = 0
//        var sales = 0
//
//        for i in 0 ..< users.count {
//            var salesSum = 0
//
//            let user = users[i]
//            let userRate = user[0]
//            let userMaxValue = user[1]
//
//            for j in 0 ..< rateCases.count {
//                if userRate > rateCases[j] {
//                    continue
//                }
//
//                salesSum += Int((100.0 - Double(rateCases[j])) / 100.0 * Double(emoticons[j]))
//                salesSum += Int((100.0 - Double(rateCases[j])) * Double(emoticons[j]) / 100.0)
//            }
//
//            if salesSum >= userMaxValue {
//                emoticonPlus += 1
//            } else {
//                sales += salesSum
//            }
//        }
//
//        if maxEmoticonPlus > emoticonPlus {
//            return
//        }
//
//        if maxEmoticonPlus == emoticonPlus && maxSales >= sales {
//            return
//        }
//
//        maxEmoticonPlus = emoticonPlus
//        maxSales = sales
//    }
//
//    func dfs(rateCase: inout [Int]) {
//        if rateCase.count == emoticons.count {
//            calculate(rateCases: rateCase)
//            return
//        }
//
//        for i in 0 ..< salesRates.count {
//            rateCase.append(salesRates[i])
//            dfs(rateCase: &rateCase)
//            rateCase.removeLast()
//        }
//    }
//
//    var rateCase: [Int] = []
//    dfs(rateCase: &rateCase)
//
//    return [maxEmoticonPlus, maxSales]
// }

let x = 10
let y = 1200

// x, y 는 둘다 1 이상
// x 는 100 보다 작음
let resultA = (100.0 - Double(x)) / 100.0 * Double(y)
let resultB = (100.0 - Double(x)) * 0.01 * Double(y)

print(resultA, resultB)
