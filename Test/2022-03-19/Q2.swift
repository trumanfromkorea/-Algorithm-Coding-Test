import Foundation

// MARK: - 실행

// solution([140, 21, 21, 32], [2, 1, 3, 7])
solution([3,5,4], [3,2,1])

// MARK: - 구현

struct Book {
    var width: Int
    var height: Int
}

func solution(_ height: [Int], _ width: [Int]) -> Int64 {
    var books: [Book] = []

    var maxSize = 0
    var stackedWidth = 0

    for (w, h) in zip(width, height) {
        books.append(Book(width: w, height: h))
    }

    books.sort(by: { $0.height > $1.height }) // sort 메소드에대해

    for book in books {
        stackedWidth += book.width

        let compSize = stackedWidth * book.height

        if maxSize < compSize {
            maxSize = compSize
        }
    }

    return Int64(maxSize)
}
