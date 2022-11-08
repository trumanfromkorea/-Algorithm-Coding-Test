import Foundation

func solution(_ n: Int, _ k: Int) -> Int {
    var answer = 0
    let radix = String(n, radix: k)

    let numbers = radix
        .components(separatedBy: "0")
        .filter { !$0.isEmpty }

    for number in numbers {
        let decimal = Int(number, radix: 10)!

        answer += isPrime(decimal) ? 1 : 0
    }

    return answer
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }

    let squared = sqrt(Double(n))
    let div = Int(ceil(squared))

    for i in 2 ... div {
        if n % i == 0 {
            return false
        }
    }

    return true
}
