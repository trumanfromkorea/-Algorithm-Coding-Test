
import Foundation

class Car {
    var id: String
    var startTime: Int?
    var duration: Int
    var fee: Int

    init(id: String, startTime: Int? = nil, duration: Int) {
        self.id = id
        self.startTime = startTime
        self.duration = duration
        fee = 0
    }
}

func solution(_ fees: [Int], _ records: [String]) -> [Int] {
    var cars: [Car] = []
    let lastTime = 23 * 60 + 59

    for record in records {
        let separated = record.split(separator: " ").map { String($0) }

        let time = separated[0].split(separator: ":").compactMap { Int(String($0)) }
        let timeStamp = time[0] * 60 + time[1]

        if let car = cars.first(where: { $0.id == separated[1] }) {
            if separated[2] == "IN" {
                car.startTime = timeStamp
            } else {
                car.duration += timeStamp - (car.startTime ?? 0)
                car.startTime = nil
            }

        } else {
            let newCar = Car(id: separated[1], startTime: timeStamp, duration: 0)
            cars.append(newCar)
        }
    }

    cars.compactMap {
        if $0.startTime != nil { return $0 }
        else { return nil }
    }.forEach { (car: Car) in
        car.duration += lastTime - (car.startTime ?? lastTime)
    }

    cars.forEach {
        var result = 0

        if $0.duration > fees[0] {
            $0.duration -= fees[0]
            result += fees[1]
        } else {
            $0.fee = fees[1]
            return
        }

        let div = ceil(Double($0.duration) / Double(fees[2]))
        result += fees[3] * (Int(div) ?? 1)

        $0.fee = result
    }

    return cars.sorted { $0.id < $1.id }.map { $0.fee }
}
