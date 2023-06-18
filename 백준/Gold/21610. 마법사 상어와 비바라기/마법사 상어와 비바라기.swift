var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var n = input[0]
var m = input[1]
var map = [[Int]]()
for _ in 0..<n{
    map.append(readLine()!.split(separator: " ").compactMap{Int(String($0))!})
}
var block = [(Int,Int)]()
block.append(contentsOf: [(n-1,0),(n-1,1),(n-2,0),(n-2,1)])



for _ in 0..<m{
    
    input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var d = input[0]
    var s = input[1]
    var dr = [0,-1,-1,-1,0,1,1,1]
    var dc = [-1,-1,0,1,1,1,0,-1]
    
    
    for i in 0..<block.count{//블록들 방향따라 s칸 이동
        var nr = block[i].0+dr[d-1]*s%n
        var nc = block[i].1+dc[d-1]*s%n
        if(nr<0){nr = nr+n}
        if(nc<0){nc = nc+n}
        if(nr>n-1){nr = nr-n}
        if(nc>n-1){nc = nc-n}
        
        block[i].0 = nr
        block[i].1 = nc
        map[nr][nc] += 1// 비옴
    }

    //물복사
    for i in 0..<block.count{
        var dia = [1,3,5,7]
        var count = 0
        for idx in dia{
            var nr = block[i].0 + dr[idx]
            var nc = block[i].1 + dc[idx]
            if(0..<n ~= nr && 0..<n ~= nc){
                if map[nr][nc]>0{
                    count += 1
                }
            }
        }
        map[block[i].0][block[i].1]+=count

    }

    var newblock = [(Int,Int)]()
    for i in 0..<n{
        for j in 0..<n{
           
            if (block.contains(where: {$0 == (i,j)})) {
                continue
            }else{
                if(map[i][j]>=2){
                    map[i][j]-=2
                    newblock.append((i,j))
                }
            }
        }
    }
    block = newblock

}

var sum = 0
for i in 0..<n{
    for j in 0..<n{
        sum += map[i][j]
    }
}

print(sum)

