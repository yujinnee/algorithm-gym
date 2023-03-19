var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var n = input[0]
var m = input[1]
var room = [[Int]]()
input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var rpos = (r:input[0],c:input[1])
var direction = input[2]

for i in 0..<n{
    room.append(readLine()!.split(separator: " ").compactMap{Int(String($0))})
}

var idx = 0
var dx = [-1,0,1,0]
var dy = [0,1,0,-1]
//  0
//3   1
//  2
//
var count = 0
room[rpos.r][rpos.c] = 3
count += 1

while(true){

    var cpos = rpos
    var isAllClean = true
    for i in 0..<4{
        var nx = cpos.r+dx[i]
        var ny = cpos.c+dy[i]
        if(1..<n-1 ~= nx && 1..<m-1 ~= ny && room[nx][ny] == 0){
            isAllClean = false
        }
    }
    
    if(!isAllClean){
        while(true){
            direction = (direction+4-1)%4
            var nx = cpos.r+dx[direction]
            var ny = cpos.c+dy[direction]
            if(room[nx][ny]==0){
                rpos = (nx,ny)
                room[nx][ny] = 3
                count+=1
                break
            }
        }
    }else{
        
        var nx = cpos.r+dx[(direction+4-2)%4]
        var ny = cpos.c+dy[(direction+4-2)%4]
        if(room[nx][ny]==1){
            break
        }else if(room[nx][ny] == 0){
            rpos = (nx,ny)
            room[nx][ny] = 3
            count += 1
        }else{
            rpos = (nx,ny)
        }
    }
    
}

print(count)


