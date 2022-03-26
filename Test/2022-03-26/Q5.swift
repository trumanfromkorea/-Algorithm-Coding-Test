import Foundation

func solution(_ abilities: [Int], _ _k: Int) -> Int64 {
    var abil = abilities.sorted()
    var k = _k
    var answer = 0

    if abilities.count % 2 == 0 {
        answer = fetchPlayers(&abil, &k, 0)
    } else {
        let last = abil.removeFirst()
        answer = fetchPlayers(&abil, &k, 1) + last
    }

    return Int64(answer)
}

func fetchPlayers(_ abil: inout [Int], _ k: inout Int, _ i: Int) -> Int {
    var answer = 0
    var numbers = [nums]()

    while abil.count > 0 {
        let a = abil.removeLast()
        let b = abil.removeLast()

        numbers.append(nums(a: a, b: b))
    }

    numbers.sort(by: { $0.a - $0.b > $1.a - $1.b })

    while numbers.count > 0 {
        let now = numbers.removeFirst()

        if k > i {
            answer += now.a
        } else {
            answer += now.b
        }
    }

    return answer
}

struct nums {
    var a: Int
    var b: Int
}
