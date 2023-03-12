var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var m = input[0]
var n = input[1]
var k = input[2]
var paper = Array(repeating: Array(repeating: 0, count: n), count: m)
for _ in 0..<k{
    input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
    var x1 = input[0]
    var y1 = input[1]
    var x2 = input[2]
    var y2 = input[3]
    
    for i in y1..<y2{
        for j in x1..<x2{
            paper[i][j] = 1
        }
    }
    
}

var queue = [(Int,Int)]()
var idx = 0
var dx = [1,-1,0,0]
var dy = [0,0,1,-1]


var answer = 0
var answerArray = [Int]()


for i in 0..<m{
    for j in 0..<n{
        if paper[i][j] == 0 {
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
            if(0..<m ~= nx && 0..<n ~= ny && paper[nx][ny]==0){
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
var answerString = String(sortedArray[0])
for i in 1..<sortedArray.count{
    answerString.append(" \(String(sortedArray[i]))")
}
print(answerString)


