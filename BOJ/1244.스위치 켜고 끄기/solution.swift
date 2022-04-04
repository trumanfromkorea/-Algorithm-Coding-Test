import Foundation

let n: Int = Int(readLine()!)!

var switches: [Bool] = readLine()!.split(separator: " ").map { Int($0)! == 1 ? true : false }

let m: Int = Int(readLine()!)!

var answer: String = ""

for _ in 0 ..< m {
    let input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

    let gender: Int = input[0]
    let num: Int = input[1]

    if gender == 1 {
        var index = num

        while index - 1 < n {
            switches[index - 1] = !switches[index - 1]
            index += num
        }
    } else {
        let index = num - 1
        var step = 1

        switches[index] = !switches[index]

        while index - step >= 0 && index + step < n {
            if switches[index - step] == switches[index + step] {
                switches[index - step] = !switches[index - step]
                switches[index + step] = !switches[index + step]
                step += 1
            } else {
                break
            }
        }
    }
}

for (i, s) in switches.enumerated() {
    answer += s ? "1 " : "0 "
    if (i + 1) % 20 == 0 {
        answer += "\n"
    }
}

print(answer)
