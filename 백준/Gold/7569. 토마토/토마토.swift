var m = Int()
var n = Int()
var h = Int()
var input = readLine()!.split(separator:" ").compactMap{Int(String($0))}
m = input[0]
n = input[1]
h = input[2]
var box = [[[Int]]]()

for _ in 0..<h{
    var board = [[Int]]()
    for _ in 0..<n{
        var line = readLine()!.split(separator:" ").compactMap{Int(String($0))}
        board.append(line)
    }
    box.append(board)
}

var dx = [1,0,-1,0,0,0]
var dy = [0,1,0,-1,0,0]
var dz = [0,0,0,0,1,-1]
var queue = Array<(Int,Int,Int)>()
var distance = Array(repeating: Array(repeating: Array(repeating: 0, count: m), count: n),count: h)
var day = 0
var idx = 0
for i in 0..<h{
    for j in 0..<n{
        for k in 0..<m{
            if(box[i][j][k]==1){
                queue.append((i,j,k))
            }
        }
    }
}

bfs()

func bfs(){
    while(idx<queue.count){
        var (x,y,z) = queue[idx]
        idx += 1
        for i in 0..<6 {
            var (nx,ny,nz) = (x+dx[i],y+dy[i],z+dz[i])
            if nx<0 || nx >= h || ny < 0 || ny >= n || nz<0 || nz >= m{ continue }
            if box[nx][ny][nz] == -1 || box[nx][ny][nz]>=1 {continue}
            box[nx][ny][nz] = box[x][y][z] + 1
            queue.append((nx,ny,nz))
        }
    }
}

var max = box[0][0][0]
var answer = -1
var isAll = true
for i in 0..<h{
    for j in 0..<n{
        for k in 0..<m{
            if box[i][j][k] == 0{
                isAll = false
            }else{
                max = max >= box[i][j][k] ? max : box[i][j][k]
            }
        }
    }
}

answer = isAll ? max-1 : -1
print(answer)