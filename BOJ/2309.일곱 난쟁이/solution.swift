import Foundation

var n: Int = 9
var remains: Int = 0
var heightList: [Int] = []

for _ in 0 ..< n {
    let value: Int = Int(readLine()!)!
    heightList.append(value)
    remains += value
}

remains -= 100
filterHeights()

for output in heightList.sorted() {
    print(output)
}

func filterHeights() {
    for i in 0 ..< n {
        for j in i + 1 ..< n {
            let a: Int = heightList[i]
            let b: Int = heightList[j]
            if a + b == remains {
                heightList.remove(at: j)
                heightList.remove(at: i)
                return
            }
        }
    }
}
