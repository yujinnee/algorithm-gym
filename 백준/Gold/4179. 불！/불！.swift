var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var r = input[0]
var c = input[1]
var maze = Array(repeating: Array(repeating: " ", count: c), count: r)
var jpos = (0,0)
var fpos = [(Int,Int)]()

for i in 0..<r{
    var string = readLine()!.compactMap{String($0)}
    maze[i]  = string
    for j in 0..<c{
//        maze[i][j] = string[j]
        if(maze[i][j]=="J"){
            maze[i][j] = "0"
            jpos = (i,j)
        }else if(maze[i][j]=="F"){
            fpos.append((i,j))
        }
    }
}

var jqueue = [(Int,Int)]()
var fqueue = [(Int,Int)]()
var dx = [1,-1,0,0]
var dy = [0,0,1,-1]
var idx = 0
jqueue.append(jpos)
fqueue.append(contentsOf: fpos)
var possible = false
var count = 0

loop: while(jqueue.count != 0){

    possible = false
    
    
    var nextfqueue = [(Int,Int)]()
    while(fqueue.count != 0){
        
        var cfpos = fqueue.removeFirst()

        idx += 1
        for i in 0..<4{
            var nx = cfpos.0+dx[i]
            var ny = cfpos.1+dy[i]
            if(0..<r ~= nx && 0..<c ~= ny && maze[nx][ny] != "#" && maze[nx][ny] != "F"){
                nextfqueue.append((nx,ny))
                maze[nx][ny] = "F"
            }
            
        }
    }
    fqueue.append(contentsOf: nextfqueue)
    var nextjqueue = [(Int,Int)]()
    count += 1
    while(jqueue.count != 0){
       
        var cjpos = jqueue.removeFirst()

        for i in 0..<4{
            
            var nx = cjpos.0+dx[i]
            var ny = cjpos.1+dy[i]
            if(nx<0 || nx>=r || ny<0 || ny>=c){
                possible = true
                print(count)
                break loop
            }else{
                if(maze[nx][ny] == "."){
                    nextjqueue.append((nx,ny))
                    maze[nx][ny] = String(count)
                    possible = true
                    
                }else{
                    continue
                }
            }
        }
    }
    jqueue = nextjqueue
}

if (!possible){
    print("IMPOSSIBLE")
}
