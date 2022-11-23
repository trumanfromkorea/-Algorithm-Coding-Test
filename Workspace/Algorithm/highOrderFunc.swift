//
//  highOrderFunc.swift
//  Algorithm
//
//  Created by 장재훈 on 2022/07/13.
//

import Foundation
//
//let array = Array(0 ... 50)
//
//let mapResult = array.map { String($0) }
//let filterResult = array.filter { $0 % 2 == 0 }
//let reduceResult = array.reduce(0, +)
//
//// 계산식을 인자로 받아서 result 에 append 하는 메소드
//func computeIntArray(_ array: [Int], _ operation: (Int) -> Int) -> [Int] {
//    var result: [Int] = []
//
//    for item in array {
//        result.append(operation(item))
//    }
//
//    return result
//}
//
//let computedArray = computeIntArray(array) { $0 * 2 } // 0, 2, 4, 6 ... 100
//// print(computedArray)
//
//// 조건식을 인자로 받아서 result 에 append
//func filterIntArray(_ array: [Int], _ condition: (Int) -> Bool) -> [Int] {
//    var result: [Int] = []
//
//    for item in array {
//        if condition(item) {
//            result.append(item)
//        }
//    }
//
//    return result
//}
//
//let filteredArray = filterIntArray(array) { $0 % 2 == 0 } // 0, 2, 4, 6, ... 50
//// print(filteredArray)
//
//// 계산식 인자로 받아서 결과를 더해 append 하는 메소드
//func reduceIntArray(_ array: [Int], _ intialResult: Int, operation: (Int, Int) -> Int) -> Int {
//    var result = intialResult
//
//    for item in array {
//        result = operation(result, item)
//    }
//
//    return result
//}
//
//let reducedArray = reduceIntArray(array, 0, operation: +) // 1275
//// print(reducedArray)
//
//// Extension 으로 활용
//extension Array {
//    func customMap<T>(operation: (Element) -> T) -> [T] {
//        var result: [T] = []
//
//        for item in self {
//            result.append(operation(item))
//        }
//
//        return result
//    }
//
//    func customFilter(condition: (Element) -> Bool) -> [Element] {
//        var result = Self()
//
//        for item in self {
//            if condition(item) {
//                result.append(item)
//            }
//        }
//
//        return result
//    }
//
//    func customReduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
//        var result = initialResult
//
//        for item in self {
//            result = nextPartialResult(result, item)
//        }
//
//        return result
//    }
//}
//
//let customMap = array.customMap { String($0) }
//// print(customMap)
//
//let customFilter = array.customFilter { $0 % 2 == 0 }
////print(customFilter)
//
//// array -> Int
//// reduce -> String
//let customReduce = array.customReduce(0) { result, item in
//    result * item
//}
////print(customReduce)
