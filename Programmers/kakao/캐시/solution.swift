func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var answer = 0
    var cache: [String] = []

    for city in cities {
        let city = city.lowercased()

        if cache.contains(city) {
            cache.removeAll(where: { $0 == city })
            cache.append(city)
            answer += 1
            continue
        }

        if cache.count >= cacheSize && !cache.isEmpty {
            cache.removeFirst()
        }

        if cacheSize > 0 {
            cache.append(city)
        }

        answer += 5
    }

    return answer
}
