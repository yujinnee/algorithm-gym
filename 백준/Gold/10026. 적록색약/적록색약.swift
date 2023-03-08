
import Foundation

var n = Int()
var paper = [[String]]()
n = Int(readLine()!)!
for _ in 0..<n{
    var input = readLine()!.compactMap{String($0)}
    paper.append(input)

}

var dx=[1,0,-1,0]
var dy=[0,1,0,-1]
var queue = [(Int,Int)]()
var idx = 0
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var nowCharacter = ""
var normalCount = 0
var disableCount = 0
for i in 0..<n{
    for j in 0..<n{
        if !visited[i][j]{
            queue.append((i,j))
            nowCharacter = paper[i][j]
            normalCount += 1
            bfs()
        }
    }
}
func bfs(){
    while(idx<queue.count){
        let x = queue[idx].0
        let y = queue[idx].1
        visited[x][y] = true
        idx += 1
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if(nx<0||nx>=n||ny<0||ny>=n) {continue}
            if(visited[nx][ny]){continue}
            if(paper[nx][ny] != nowCharacter) {continue}
            queue.append((nx,ny))
            visited[nx][ny] = true
        }
        }
    
}


visited = Array(repeating: Array(repeating: false, count: n), count: n)

for i in 0..<n{
    for j in 0..<n{
        if !visited[i][j]{
            queue.append((i,j))
            nowCharacter = paper[i][j]
            disableCount += 1
            disableBfs()
        }
    }
}
func disableBfs(){

    while(idx<queue.count){
        let x = queue[idx].0
        let y = queue[idx].1
        visited[x][y] = true
        idx += 1
        for i in 0..<4{
            let nx = x + dx[i]
            let ny = y + dy[i]
            if(nx<0||nx>=n||ny<0||ny>=n) {continue}
            if(visited[nx][ny]){continue}
            if(nowCharacter == "R" || nowCharacter == "G"){
                if(paper[nx][ny]=="B"){
                    continue
                }
            }else{
                if(paper[nx][ny]=="R"||paper[nx][ny]=="G")
                { continue}
            }
            queue.append((nx,ny))
            visited[nx][ny] = true
        }
        }
    
}

print("\(normalCount) \(disableCount)")
