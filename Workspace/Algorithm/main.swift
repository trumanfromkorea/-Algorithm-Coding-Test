import Foundation

func solution(_ scores: [[Int]]) -> Int {
    var answer = 1

    let target = scores[0]
    let targetScore = target[0] + target[1]
    let sortedScore = scores.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] > $1[0]
    }

    var threshold = 0
    for score in sortedScore {
        if target[0] < score[0] && target[1] < score[1] {
            return -1
        }

        if threshold <= score[1] {
            if targetScore < score[0] + score[1] {
                answer += 1
            }
            threshold = score[1]
        }
    }

    return answer
}

func solution2(_ scores: [[Int]]) -> Int {
    var answer = 1

    let wanho = scores[0]
    let wanhoScore = wanho[0] + wanho[1]
    var scores = scores.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] > $1[0]
    }

    var temp = 0

    for i in 0 ..< scores.count {
        let score = scores[i]

        if score[0] > wanho[0] && score[1] > wanho[1] {
            return -1
        }

        if temp <= score[1] {
            if wanhoScore < score[0] + score[1] {
                answer += 1
            }
            temp = score[1]
        }
    }

    return answer
}
