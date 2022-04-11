import Foundation

func solution(_ _progress: [Int], _ _speeds: [Int]) -> [Int] {
    var progress = _progress
    var speeds = _speeds

    var day = 0
    var release = 0
    var answer: [Int] = []

    while !progress.isEmpty && !speeds.isEmpty {
        day += 1
        release = 0

        for i in 0 ..< progress.count {
            progress[i] += speeds[i]
        }

        while !progress.isEmpty && progress.first! >= 100 {
            progress.removeFirst()
            speeds.removeFirst()
            release += 1
        }

        if release > 0 { answer.append(release) }
    }
    
    return answer
}
