func solution(_ enroll: [String], _ referral: [String], _ seller: [String], _ amount: [Int]) -> [Int] {
    var dict: [String: Person] = [:]

    for (index, (person, parent)) in zip(enroll, referral).enumerated() {
        dict[person] = Person(index: index, parent: parent, sales: 0)
    }

    for (node, value) in zip(seller, amount) {
        var person = node
        var sales = Double(value * 100)

        while dict[person] != nil {
            let one = floor(sales * 0.1)

            if sales - one < 1 {
                break
            }

            dict[person]!.sales += Int(floor(sales - one))

            sales = floor(sales * 0.1)

            person = dict[person]!.parent
        }
    }

    let newDict = dict.sorted(by: { $0.value.index < $1.value.index })

    return newDict.map { $0.value.sales }
}

struct Person {
    var index: Int
    var parent: String
    var sales: Int
}