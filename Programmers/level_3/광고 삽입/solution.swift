
func solution(_ play_time: String, _ adv_time: String, _ logs: [String]) -> String {
    if play_time == adv_time {
        return "00:00:00"
    }

    let (HOUR, MIN) = (3600, 60)
    let size: Int = generateTime(play_time)
    let advSize: Int = generateTime(adv_time)

    var video: [Int] = Array(repeating: 0, count: size + 1)

    generateVideo(&video, logs, size)

    var advStart = calculateTime(video, size, advSize)

    var answer = pan(advStart / HOUR) + ":"
    advStart %= HOUR
    answer += pan(advStart / MIN) + ":" + pan(advStart % 60)

    return answer
}

func generateVideo(_ video: inout [Int], _ logs: [String], _ size: Int) {
    for log in logs {
        let time = log.split(separator: "-").map { String($0) }

        let startSec: Int = generateTime(time[0])
        let endSec: Int = generateTime(time[1])

        video[startSec] += 1
        video[endSec] -= 1
    }

    for i in 1 ... size {
        video[i] += video[i - 1]
    }
}

func calculateTime(_ video: [Int], _ size: Int, _ advSize: Int) -> Int {
    let adv = video[0 ..< advSize]
    var maxSize = adv.reduce(0, +)
    var sum = maxSize
    var advStart = 0

    for i in 1 ..< size - advSize {
        sum = sum - video[i] + video[i + advSize]

        if sum > maxSize {
            maxSize = sum
            advStart = i + 1
        }
    }

    return advStart
}

func generateTime(_ time: String) -> Int {
    let separated: [Int] = time.split(separator: ":").map { Int(String($0))! }
    let hour = separated[0] * 3600
    let min = separated[1] * 60
    let sec = separated[2]

    return hour + min + sec
}

func pan(_ num: Int) -> String {
    return num < 10 ? "0\(num)" : "\(num)"
}
