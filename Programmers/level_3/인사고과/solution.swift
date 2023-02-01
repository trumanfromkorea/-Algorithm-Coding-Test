import Foundation

func solution(_ scores: [[Int]]) -> Int {
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
