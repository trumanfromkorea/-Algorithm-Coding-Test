// 피보나치 수열로 학습하는 DP

import Foundation

var fib_array: [Int] = [1, 1]

func fib_naive(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return fib_naive(n: n - 1) + fib_naive(n: n - 2)
    }
}

func fib_recursive_dp(n: Int) -> Int {
    if n < fib_array.count {
        return fib_array[n]
    } else {
        let fib: Int = fib_recursive_dp(n: n - 1) + fib_recursive_dp(n: n - 2)
        fib_array.append(fib)
        return fib
    }
}

func fib_dp(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    }

    fib_array = [1, 1]

    for i in 2 ... n {
        let num: Int = fib_array[i - 1] + fib_array[i - 2]
        fib_array.append(num)
    }
    return fib_array[n]
}