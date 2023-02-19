import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {

    var distance = [Int](repeating: 0, count: n+1)
    var graph = [[Int]](repeating: [Int](), count: n+1)

    for i in edge.indices {

        graph[edge[i][0]].append(edge[i][1])
        graph[edge[i][1]].append(edge[i][0])
    }

    bfs(&distance, graph)

    distance.sort(by: >)

    return distance.filter { $0 == distance.first }.count
}

func bfs(_ distance: inout [Int], _ graph: [[Int]]) {
    var q = [Int]()

    q.append(1)
    distance[1] = 1
    var idx = 0
    while idx < q.count {
        let now = q[idx]
        idx += 1

        for next in graph[now] where distance[next] < 1 {
            distance[next] = distance[now] + 1
            q.append(next)
        }
    }
}
