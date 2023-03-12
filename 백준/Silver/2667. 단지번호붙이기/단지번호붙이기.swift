
var n = Int(readLine()!)!
var paper = [[Int]]()
for _ in 0..<n{
    var input = readLine()!.compactMap{Int(String($0))}
    paper.append(input)
}
var queue = [(Int,Int)]()
var idx = 0
var dx = [1,-1,0,0]
var dy = [0,0,1,-1]


var answer = 0
var answerArray = [Int]()


for i in 0..<n{
    for j in 0..<n{
        if paper[i][j] == 1 {
            queue.append((i,j))
            paper[i][j] = 2
            answer = 1
            bfs()
            answerArray.append(answer)
            
        }
    }
}

func bfs(){
    while(idx<queue.count){
        var now = queue[idx]
        idx += 1
        for i in 0..<4{
            var nx = now.0+dx[i]
            var ny = now.1+dy[i]
            if(0..<n ~= nx && 0..<n ~= ny && paper[nx][ny]==1){
                queue.append((nx,ny))
                answer += 1
                paper[nx][ny] = 2
            }
        }
        
    }
}

var sortedArray = answerArray.sorted()
print(sortedArray.count)
//print(sortedArray)
for s in sortedArray{
    print(s)
}


