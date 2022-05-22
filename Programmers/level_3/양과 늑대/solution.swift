func solution(_ info: [Int], _ edges: [[Int]]) -> Int {
    let params = Params(graph: generateGraph(edges), info: info)
    var maxSheep = 0

    if params.graph[0] == nil {
        return params.info[0]
    }

    DFS([0], 0, 0, params, &maxSheep)

    return maxSheep
}

struct Params {
    let graph: [Int: [Int]]
    let info: [Int]
}

func generateGraph(_ edges: [[Int]]) -> [Int: [Int]] {
    var graph: [Int: [Int]] = [:]

    for item in edges {
        if graph[item[0]] != nil {
            graph[item[0]]!.append(item[1])

        } else {
            graph[item[0]] = [item[1]]
        }
    }

    return graph
}

func DFS(_ moveTo: [Int], _ sheep: Int, _ wolf: Int, _ params: Params, _ maxSheep: inout Int) {
    for (i, node) in moveTo.enumerated() {
        let nextSheep = sheep + (params.info[node] == 0 ? 1 : 0)
        let nextWolf = wolf + (params.info[node] == 0 ? 0 : 1)

        if nextSheep <= nextWolf {
            continue
        }

        maxSheep = max(maxSheep, nextSheep)

        var tempMoveTo = moveTo
        tempMoveTo.remove(at: i)
        tempMoveTo += params.graph[node] ?? []

        DFS(tempMoveTo, nextSheep, nextWolf, params, &maxSheep)
    }
}