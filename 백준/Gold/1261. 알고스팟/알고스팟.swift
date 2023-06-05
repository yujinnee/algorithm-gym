import Foundation

let location = readLine()!.split(separator: " ").map {Int(String($0))!}

let N = location[0] - 1
let M = location[1] - 1

var graph = [[Int]]()
var needToVisit = [(Int,Int)]()
var counts = Array(repeating: Array(repeating: Int.max, count: 101), count: 101)

for _ in 0...M {
    let arr = Array(readLine()!).map{Int(String($0))!}
    graph.append(arr)
}

func bfs(row: Int, col: Int) {
    needToVisit.append((row,col))
    counts[row][col] = 0
    
    while !needToVisit.isEmpty {
        let node = needToVisit.removeFirst()
        for i in [(-1,0),(0,1), (0,-1),(1,0)] {
            let nx = node.0 + i.0
            let ny = node.1 + i.1
            
            if 0...M ~= nx && 0...N ~= ny {
                if graph[nx][ny] == 1 {
                    if counts[nx][ny] > counts[node.0][node.1] + 1{
                        counts[nx][ny] = counts[node.0][node.1] + 1
                        needToVisit.append((nx,ny))
                    }
                    
                } else if graph[nx][ny] == 0 {
                    if counts[nx][ny] > counts[node.0][node.1] {
                        counts[nx][ny] = counts[node.0][node.1]
                        needToVisit.append((nx,ny))
                    }
                }
            }
        }
    }
}

bfs(row: 0, col: 0)
print(counts[M][N])