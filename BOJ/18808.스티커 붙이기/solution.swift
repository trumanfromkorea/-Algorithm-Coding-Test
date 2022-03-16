import Foundation

// MARK: - 함수 선언부

// 스티커 회전 메소드
func rotateSticker(rn: Int, rm: Int, _sticker: [[Int]]) -> [[Int]] {
    var tmpBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: 10)
    var sticker: [[Int]] = _sticker

    for i in 0 ..< rn {
        for j in 0 ..< rm {
            tmpBoard[i][j] = sticker[i][j]
        }
    }

    sticker = Array(repeating: Array(repeating: 0, count: rn), count: rm)

    for i in 0 ..< rm {
        for j in 0 ..< rn {
            sticker[i][j] = tmpBoard[rn - 1 - j][i]
        }
    }

    return sticker
}

// 스티커 붙이기
func putSticker(si: Int, sj: Int, testSticker: [[Int]]) -> Bool {
    var isAvailable = false

    // 보드 위 탐색
    for i in 0 ..< n {
        for j in 0 ..< m {
            isAvailable = true

            // 스티커 붙일수 있는지 탐색
            for k in i ..< i + si {
                // 범위 검사
                if i + si > n {
                    isAvailable = false
                    break
                }
                for l in j ..< j + sj {
                    // 범위 검사
                    if j + sj > m {
                        isAvailable = false
                        break
                    }

                    // 겹치면 합이 2가 되니까 안되고
                    if testBoard[k][l] + testSticker[k - i][l - j] == 2 {
                        isAvailable = false
                        break
                    } else {
                        // 안겹치면 그자리에 덮어씌워주기
                        testBoard[k][l] += testSticker[k - i][l - j]
                    }
                }
                // 틀렸을때는 항상 원래 상태로 보드 돌려놓기
                if !isAvailable {
                    testBoard = board
                    break
                }
            }
            // 맞으면 테스트로 붙여봤던거 다시 저장
            if isAvailable {
                board = testBoard
                return isAvailable
            }
        }
    }

    return isAvailable
}

// MARK: - 구현부

// 보드 크기, 스티커 개수
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (input[0], input[1], input[2])

// 스티커 붙여보다가 틀렸을때를 대비해서 두개 만들기
var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
var testBoard: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for _ in 0 ..< k {
    // 스티커 크기
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (si, sj) = (info[0], info[1])

    var sticker: [[Int]] = []

    for _ in 0 ..< si {
        let line = readLine()!.split(separator: " ").map { Int(String($0))! }
        sticker.append(line)
    }

    // 4번 회전하면서 시도
    for _ in 0 ..< 4 {
        let success = putSticker(si: si, sj: sj, testSticker: sticker)
        if success {
            break
        } else {
            sticker = rotateSticker(rn: si, rm: sj, _sticker: sticker)
            swap(&si, &sj)
        }
    }
}

var answer: Int = 0

for i in 0 ..< n {
    for j in 0 ..< m {
        answer += board[i][j]
    }
}

print(answer)
