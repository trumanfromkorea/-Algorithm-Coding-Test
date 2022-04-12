let n = Int(readLine()!)!

var array = [Int]()

for _ in 0 ..< n {
    array.append(Int(readLine()!)!)
}

for item in array.sorted() {
    print(item)
}
