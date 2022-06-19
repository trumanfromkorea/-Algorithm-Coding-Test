import Foundation

let n = Int(readLine()!)!

var answer = ""

var visited = [Bool]()
var array = [Int]()
var team = [Int]()
var set = Set<Int>()

for _ in 0 ..< n {
    let arrayNum = Int(readLine()!)!
    set = Set<Int>()

    array = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
    visited = Array(repeating: false, count: arrayNum + 1)

    for i in 1 ... arrayNum {
        if visited[i] {
            continue
        }

        team = [Int]()
        DFS(i)
    }

    answer += "\(arrayNum - set.count)\n"
}

print(answer)

func DFS(_ index: Int) {
    team.append(index)
    visited[index] = true
    let next = array[index]

    if visited[next] == true {
        if team.contains(next) {
            let start = team.firstIndex(of: next)!
            set.formUnion(team[start...])
        }
        return
    } else {
        DFS(next)
    }
}