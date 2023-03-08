var m = Int()
var n = Int()
var input = readLine()!.split(separator:" ").compactMap{Int(String($0))}
m = input[0]
n = input[1]
var box = [[Int]]()

for _ in 0..<n{
    var line = readLine()!.split(separator:" ").compactMap{Int(String($0))}
    box.append(line)
}

var dx = [1,0,-1,0]
var dy = [0,1,0,-1]
var queue = Array<(Int,Int)>()
var idx = 0

for i in 0..<n{
    for j in 0..<m{
        if(box[i][j]==1){
            queue.append((i,j))
        }
    }
}

bfs()

func bfs(){
    while(idx<queue.count){
        var (x,y) = queue[idx]
        idx += 1
        for i in 0..<4 {
            var (nx,ny) = (x+dx[i],y+dy[i])
            if nx<0 || nx >= n || ny < 0 || ny >= m { continue }
            if box[nx][ny] == -1 || box[nx][ny]>=1 {continue}
            box[nx][ny] = box[x][y] + 1
            queue.append((nx,ny))
        }
    }
}

var max = box[0][0]
var answer = -1
var isAll = true
for i in 0..<n{
    for j in 0..<m{
        if box[i][j] == 0{
            isAll = false
        }else{
            max = max >= box[i][j] ? max : box[i][j]
        }
    }
}

answer = isAll ? max-1 : -1
print(answer)

