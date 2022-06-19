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

// var array = [Int]()
// var check = [Bool]()
// var teams = [[Int]]()
//
// for _ in 0 ..< Int(readLine()!)! {
//    let n = Int(readLine()!)!
//    array = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
//    check = [Bool](repeating: false, count: n + 1)
//    teams = [[Int]]()
//
//    for i in 0 ..< n + 1 {
//        if check[i] == false {
//            var team = [Int]()
//            dfs(i, &team)
//        }
//    }
//
//    print(n + 1 - teams.flatMap { $0 }.count)
// }
//
// func dfs(
//    _ num: Int,
//    _ team: inout [Int]
// ) {
//    check[num] = true
//    team.append(num)
//    // 선택한 학생의 번호
//    let next = array[num]
//
//    // 선택한 학생이 팀이 없을 때
//    if check[next] == false {
//        dfs(next, &team)
//    } else {
//        // 선택한 학생의 번호가 team에 포함되어 있다면 cycle 형성되므로 팀을 이룸
//        if team.contains(next) {
//            teams.append(Array(team[team.firstIndex(of: next)!...]))
//        }
//        return
//    }
// }
