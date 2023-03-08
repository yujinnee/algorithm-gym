var t = Int(readLine()!)!


var dx = [1,0,-1,0]
var dy = [0,1,0,-1]

var count = 0
for _ in 0..<t{
    var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    var m = input[0]
    var n = input[1]
    var ground = Array(repeating: Array(repeating: 0, count: m) ,count: n)
    var k = input[2]
    var visited = Array(repeating: Array(repeating: false, count: m) ,count: n)
    var queue = [(Int,Int)]()
    var idx = 0
    for _ in 0..<k{
        input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
        var x = input[1]
        var y = input[0]
        ground[x][y] = 1
    }
    
    for i in 0..<n{
        for j in 0..<m{
            if(ground[i][j]==1 && !visited[i][j]){
                count+=1
                queue.append((i,j))
                bfs()
            }
        }
    }
    
    
    
    func bfs(){
        while(idx<queue.count){
            var (x,y) = queue[idx]
            visited[x][y] = true
            idx += 1
            for i in 0..<4{
                var nx = x+dx[i]
                var ny = y+dy[i]
                if(nx<0 || nx>=n || ny<0 || ny>=m) {continue}
                if(visited[nx][ny]||ground[nx][ny]==0){continue}
                queue.append((nx,ny))
                visited[nx][ny] = true
                
            }
        }
        
    }

    print(count)
    count = 0
    
}
