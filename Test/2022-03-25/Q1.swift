import Foundation

func solution(_ num: Int) -> Int {
    var n = num
    var answer = 0

    while n >= 10 {
        n = calculate(n)
        answer += 1
    }

    return n == 1 ? answer : -1
}

// 모든 자리수 제곱해서 더하기
func calculate(_ num: Int) -> Int {
    var n = num
    var result = 0

    while n >= 10 {
        result += square(n % 10)
        n /= 10
    }

    result += square(n)

    return result
}

// 제곱
func square(_ n: Int) -> Int {
    return Int(pow(Double(n), 2))
}
