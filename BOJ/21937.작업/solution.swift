import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

if m == 0 || (n == 1 && m == 1) {
    print(0)
    exit(0)
}

var infoList: [Int: [Int]] = [:]
var parents = Set<Int>()

for _ in 0 ..< m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let (from, to) = (line[0], line[1])

    if infoList[to] == nil {
        infoList[to] = []
    }

    infoList[to]?.append(from)
}

let target = Int(readLine()!)!

dfs(index: target, resultSet: &parents)

print(parents.count)

func dfs(index: Int, resultSet: inout Set<Int>) {
    guard let array = infoList[index] else {
        return
    }

    for i in 0 ..< array.count {
        if resultSet.contains(array[i]) {
            continue
        }
        
        resultSet.insert(array[i])
        dfs(index: array[i], resultSet: &resultSet)
    }
}
