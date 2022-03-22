import Foundation

// MARK: - 실행

let sol = solution(
    [
        [0, 2, 1, 3],
        [1, 2, 2, 5],
        [3, 3, 4, 4],
        [4, 1, 6, 3],
        [1, 6, 5, 7],
        [5, 5, 7, 6],
        [5, 8, 6, 10],
    ]
)

//print("solution : ", sol)

// MARK: - 구현

func solution(_ rectangles: [[Int]]) -> [String] {
    var endDown = false
    var endLeft = false
    
    var R = rectangles
    var answer: [String] = []

    while !endDown {
        (R, endDown) = goDown(R)
    }
    
    while !endLeft {
        (R, endLeft) = goLeft(R)
    }
    
    for r in R {
        let a = "\(r[0]) \(r[1]) \(r[2]) \(r[3])"
        answer.append(a)
    }

    return answer
}

func goDown(_ rectangles: [[Int]]) -> ([[Int]], Bool) {
    var R = rectangles
    var endCount = 0

    for i in 0 ..< R.count {
        // 이미 x축에 닿아있으면
        if R[i][1] == 0 {
            endCount += 1
            continue
        }

        var collide = false

        for j in 0 ..< R.count {
            if i == j {
                continue
            }

            let leftC = R[i][0] >= R[j][0] && R[i][0] < R[j][2]
            let rightC = R[i][2] > R[j][0] && R[i][2] <= R[j][2]

            if leftC || rightC {
                // 충돌하는지
                if R[i][1] == R[j][3] {
                    collide = true
                    break
                }
            }
        }

        if !collide {
            R[i][1] -= 1
            R[i][3] -= 1
        } else {
            endCount += 1
        }
    }

    return (R, endCount == R.count)
}

func goLeft(_ rectangles: [[Int]]) -> ([[Int]], Bool) {
    var R = rectangles
    var endCount = 0

    for i in 0 ..< R.count {
        // y축
        if R[i][0] == 0 {
            endCount += 1
            continue
        }

        var collide = false

        for j in 0 ..< R.count {
            if i == j {
                continue
            }

            let upC = R[i][1] >= R[j][1] && R[i][1] < R[j][3]
            let downC = R[i][3] > R[j][1] && R[i][3] <= R[j][3]

            if upC || downC {
                if R[i][0] == R[j][2] {
                    collide = true
                    break
                }
            }
        }

        if !collide {
            R[i][0] -= 1
            R[i][2] -= 1
        } else {
            endCount += 1
        }
    }

    return (R, endCount == R.count)
}
