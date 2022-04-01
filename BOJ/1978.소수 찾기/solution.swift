import Foundation

let n: Int = Int(readLine()!)!

let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var numbers: [Int] = Array(2 ... input.max()!)
var primeNumbers: [Int] = []

var answer: Int = 0

// 에라토스테네스의 체
for (i, n) in numbers.enumerated() {
    var isPrime = true
    for j in 0 ... i/2 {
        if n % numbers[j] == 0 && n != numbers[j] {
            isPrime = false
            break
        }
    }
    if isPrime {
        primeNumbers.append(n)
    }
}

for comp in input {
    if primeNumbers.contains(comp) {
        answer += 1
    }
}

print(answer)
