import Foundation

var n: Int = Int(readLine()!)!
let m: Int = Int(readLine()!)!

var numbers: [Int] = Array(0 ... m)

var primeNumbers: [Int] = []

var sum: Int = 0

if n == 1 {
    if m == 1 {
        print(-1)
        exit(0)
    } else {
        n += 1
    }
}

// 에라토스테네스의 체
for i in n ... m {
    var isPrime = true
    if i <= 3 {
        primeNumbers.append(i)
        continue
    }
    for j in 2 ... i / 2 {
        if i % j == 0 {
            isPrime = false
        }
    }
    if isPrime {
        primeNumbers.append(i)
    }
}

if primeNumbers.isEmpty {
    print(-1)
} else {
    sum = primeNumbers.reduce(0, +)

    print("\(sum)\n\(primeNumbers.min()!)")
}
