import Foundation

func solution(_ maps:[String]) -> Int {
    var map = [[Character]]()
    for r in maps{
        var line = [Character]()
        for c in r{
            line.append(c)
        }
        map.append(line)
    }
   
    var visited = [[Int]]()
    visited = Array(repeating: Array(repeating: 0 ,count:map[0].count),count:map.count)
    
    var start = (r:0,c:0)//시작점
   outerloop: for i in 0..<map.count{
        for j in 0..<map[i].count{
            if (map[i][j] == "S"){
                start = (i,j)
                break outerloop
            }
        }
    } 
    var dx = [0,0,1,-1]
    var dy = [1,-1,0,0]
    var now = (r:start.r,c:start.c)
    visited[now.r][now.c] += 1
    var queue = [(Int,Int)]()
    queue.append(now)
    var index = 0
    var dist = 0
    var lever = (r:0,c:0)
    var exit = (r:0,c:0)
    var hasAnswer = false
    toLeverLoop: while(index<queue.count){
        
        now = queue[index]
        index += 1
        for i in 0..<4{
            var next = (r:now.r+dx[i],c:now.c+dy[i])
            if(0..<map.count ~= next.r && 0..<map[0].count ~= next.c  && map[next.r][next.c] != "X" && visited[next.r][next.c]==0){
                 visited[next.r][next.c] = visited[now.r][now.c] + 1
                if(map[next.r][next.c]=="L"){
                    lever = (next.r,next.c)
                    hasAnswer = true
                    break toLeverLoop
                }
                queue.append(next)
            }
            
        }
       
    }
    if(!hasAnswer){return -1}
    dist = visited[lever.r][lever.c]
    visited = Array(repeating: Array(repeating: 0,count:map[0].count),count:map.count)
    visited[lever.r][lever.c] = dist
    queue = []
    index = 0
    now = (lever.r,lever.c)
    hasAnswer = false
    queue.append(now)
    toExitLoop: while(index<queue.count){
        now = queue[index]
        index += 1
        for i in 0..<4{
            var next = (r:now.r+dx[i],c:now.c+dy[i])
            
            if(0..<map.count ~= next.r && 0..<map[0].count ~= next.c  && map[next.r][next.c] != "X" && visited[next.r][next.c]==0){
                visited[next.r][next.c] = visited[now.r][now.c] + 1
                if(map[next.r][next.c]=="E"){
                    hasAnswer = true
                    exit = (next.r,next.c)
                    break toExitLoop
                }
                
                queue.append(next)
            }
        }
        
    }
    if(!hasAnswer){return -1}
  
    return visited[exit.r][exit.c] - 1


}