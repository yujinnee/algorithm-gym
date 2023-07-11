var input = readLine()!.split(separator: " ").compactMap{Int(String($0))}
var r = input[0]
var c = input[1]
var maze = Array(repeating: Array(repeating: " ", count: c), count: r)
var jpos = (0,0)
var fpos = [(Int,Int)]()
for i in 0..<r{
    var string = readLine()!.compactMap{String($0)}
//    print(string)
    for j in 0..<c{
        maze[i][j] = string[j]
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
var visitedJ = Array(repeating: Array(repeating: false, count: c), count: r)
var visitedF = Array(repeating: Array(repeating: false, count: c), count: r)
var count = 0
//while(idx<jqueue.count){
loop: while(jqueue.count != 0){
//
//    print("1")
//    for m in maze{
//        print(m)
//    }
//    print()
    possible = false
    
    
    var nextfqueue = [(Int,Int)]()
    while(fqueue.count != 0){
        
        var cfpos = fqueue.removeFirst()
    //    var cjpos = jqueue[idx]
    //    var cfpos = fqueue[idx]
        idx += 1
        for i in 0..<4{
            var nx = cfpos.0+dx[i]
            var ny = cfpos.1+dy[i]
            if(0..<r ~= nx && 0..<c ~= ny && maze[nx][ny] != "#" && maze[nx][ny] != "F" && visitedF[nx][ny] == false){
                nextfqueue.append((nx,ny))
                maze[nx][ny] = "F"
                visitedF[nx][ny] = true
            }
            
        }
    }
    fqueue.append(contentsOf: nextfqueue)
//
//    print("2")
//    print(jqueue)
//    print(fqueue)
//    for m in maze{
//        print(m)
//    }
//    print()
    
//    var cx = cjpos.0
//    var cy = cjpos.1
    
    var nextjqueue = [(Int,Int)]()
    count += 1
    while(jqueue.count != 0){
       
        var cjpos = jqueue.removeFirst()
//        if(maze[cjpos.0][cjpos.1] == "F"){
//
//        }
        
//        print(cjpos)
//
//
//        if let cnt = Int(maze[cjpos.0][cjpos.1]){
//            count = cnt
//        }

        for i in 0..<4{
            
            var nx = cjpos.0+dx[i]
            var ny = cjpos.1+dy[i]
            if(nx<0 || nx>=r || ny<0 || ny>=c){
                possible = true
                print(count)
                break loop
            }else{
                if(maze[nx][ny] == "."){
//                    print("?")
//                    print(nx,ny)
                    nextjqueue.append((nx,ny))
                    visitedJ[nx][ny] = true
//                    print("count\(count)")
                    maze[nx][ny] = String(count)
                    possible = true
                    
                }else{
                    continue
                }
            }
        }
    }
    
    jqueue = nextjqueue

    
//    print("3")
//    print(jqueue)
//    print(fqueue)
//    for m in maze{
//        print(m)
//    }
//    print()
}

if (!possible){
    print("IMPOSSIBLE")
}
