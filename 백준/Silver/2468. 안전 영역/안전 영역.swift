
var n = Int(readLine()!)!
var paper = [[Int]]()
for _ in 0..<n{
    var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    paper.append(input)
}
var queue = [(Int,Int)]()
var idx = 0
var dx = [1,-1,0,0]
var dy = [0,0,1,-1]

var max = 0
//print("--------")
//for p in paper{
//    print(p)
//}
//print("------")

for h in 0...100{
    
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var answer = 0
//
//    print("--------")
//    for v in visited{
//        print(v)
//    }
//    print("------")
    for i in 0..<n{
        for j in 0..<n{
            if paper[i][j] > h && !visited[i][j]{
                queue.append((i,j))
                visited[i][j] = true
                bfs()
                answer += 1
                
            }
        }
    }

    max = max>=answer ? max : answer

    func bfs(){
        while(idx<queue.count){
            var now = queue[idx]
            idx += 1
            for i in 0..<4{
                var nx = now.0+dx[i]
                var ny = now.1+dy[i]
                if(0..<n ~= nx && 0..<n ~= ny && paper[nx][ny]>h && !visited[nx][ny]){
                    queue.append((nx,ny))
                    visited[nx][ny] = true
                }
            }
            
        }
    }
}
print(max)


