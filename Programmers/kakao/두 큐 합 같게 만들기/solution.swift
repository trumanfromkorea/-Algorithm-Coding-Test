import Foundation

func solution(_ array1: [Int], _ array2: [Int]) -> Int {
    let sum1 = sum(array1)
    let sum2 = sum(array2)

    if (sum1 + sum2) % 2 == 1 { return -1 }

    let dividedSum = (sum1 + sum2) / 2
    let allCount = array1.count + array2.count

    var cumulativeSum = 0
    var count = 0
    var start = 0
    var end = 0

    var combinedArray: [Int]

    if sum1 > sum2 {
        combinedArray = array2 + array1
        end = array2.count - 1
        cumulativeSum = sum2
    } else if sum1 < sum2 {
        combinedArray = array1 + array2
        end = array1.count - 1
        cumulativeSum = sum1
    } else {
        return 0
    }

    while cumulativeSum != dividedSum {
        if start > end {
            return -1
        }

        if cumulativeSum > dividedSum {
            cumulativeSum -= combinedArray[start]
            start += 1
        } else if cumulativeSum < dividedSum {
            end += 1

            if end > allCount - 1 { return -1 }

            cumulativeSum += combinedArray[end]
        } else {
            return count
        }

        count += 1
    }

    return count
}

func sum(_ array: [Int]) -> Int {
    return array.reduce(0, +)
}
