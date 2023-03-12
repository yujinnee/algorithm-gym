var t = Int(readLine()!)!

for _ in 0..<t{
    var l = Int(readLine()!)!
    var now = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    var start = (now[0],now[1])
    var targetArr = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    var target = (targetArr[0],targetArr[1])
    
    var queue = [(Int,Int)]()
    var dx = [1,1,-1,-1,2,2,-2,-2]
    var dy = [2,-2,2,-2,1,-1,1,-1]
    var idx = 0
    var count = 0
    var visited = Array(repeating: Array(repeating: false, count: l), count: l)
    var distance = Array(repeating: Array(repeating: 0, count: l), count: l)
    queue.append(start)
    visited[now[0]][now[1]] = true
    distance[now[0]][now[1]] = 0
    
   count = bfs()
    print(count)
    

    func bfs()->Int{
        while(!queue.isEmpty){
            var c = queue[0]
            queue.removeFirst()
            
            idx += 1
            for i in 0..<8{
                var nx = c.0 + dx[i]
                var ny = c.1 + dy[i]
                if(nx>=l || nx<0 || ny >= l || ny<0 || visited[nx][ny]){continue}
                
                if(nx==target.0 && ny==target.1){
                    return distance[c.0][c.1]+1
                }
                queue.append((nx,ny))
                visited[nx][ny] = true
                distance[nx][ny] = distance[c.0][c.1]+1
                
            }
            
        }
        return 0
    }
   
    
    
}
