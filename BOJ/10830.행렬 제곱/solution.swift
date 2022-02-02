import Foundation

func multiple(_ matrix_01: [[Int]], _ matrix_02: [[Int]], _ n: Int) -> [[Int]] {
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)

    for i in 0 ..< n {
        for j in 0 ..< n {
            for k in 0 ..< n {
                result[i][j] += matrix_01[i][k] * matrix_02[k][j]
                result[i][j] %= 1000
            }
        }
    }

    return result
}

func printMatrix(_ matrix: [[Int]], _ n: Int) {
    
    for i in 0 ..< n {
        var line: String = ""
        for j in 0 ..< n {
            line += "\(matrix[i][j] % 1000) "
        }
        print(line)
    }
    
}

var input: [Int] = readLine()!.split(separator: " ").map { Int($0)! }

var n: Int = input[0]
var square: Int = input[1]

var matrix: [[Int]] = []
var odd: [[Int]] = []

for _ in 0 ..< n {
    matrix.append(readLine()!.split(separator: " ").map { Int(String($0))! })
}

while square > 1 {
    if square % 2 == 1 {
        if odd.isEmpty {
            odd = matrix
        } else {
            odd = multiple(matrix, odd, n)
        }
    }

    matrix = multiple(matrix, matrix, n)
    square /= 2
}

if odd.isEmpty {
    printMatrix(matrix, n)
} else {
    matrix = multiple(matrix, odd, n)
    printMatrix(matrix, n)
}
