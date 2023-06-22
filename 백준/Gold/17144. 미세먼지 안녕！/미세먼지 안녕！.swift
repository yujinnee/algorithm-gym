var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
var r = input[0]
var c = input[1]
var t = input[2]
var map = [[Int]]()

for _ in 0..<r{
    var line = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    map.append(line)
}

var upperCon = (0,0)
var lowerCon = (0,0)

func findConditioner(){
    var conditioner = [(Int,Int)]()
    for i in 0..<r{
        for j in 0..<c{
            if(map[i][j] == -1){
                conditioner.append((i,j))
            }
        }
    }
    upperCon = conditioner[0]
    lowerCon = conditioner[1]
}




func diffuse(){
//    var diffusedMaps = [[[Int]]]()
    var dr = [1,-1,0,0]
    var dc = [0,0,1,-1]
   
    var tempMap = Array(repeating: Array(repeating: 0, count: c), count: r)
    for i in 0..<r{
        for j in 0..<c{
//            var diffusedMap = Array(repeating: Array(repeating: 0, count: c), count: r)
            var originNum = map[i][j]
            var willDiffuseNum = map[i][j]/5
            var willDiffuseCount = 0
            
            if(map[i][j] == -1) {continue} //청정기
            
            for idx in 0..<4{
                var nr = i + dr[idx]
                var nc = j + dc[idx]
                if (0..<r ~= nr && 0..<c ~= nc && map[nr][nc] != -1){
//                    diffusedMap[nr][nc] = willDiffuseNum
                    tempMap[nr][nc] += willDiffuseNum
                    willDiffuseCount += 1
                }
            }
            
//            diffusedMap[i][j] = originNum - willDiffuseNum*willDiffuseCount
                map[i][j] -= willDiffuseNum*willDiffuseCount
            
//            diffusedMaps.append(diffusedMap)
            
        }
    }
    
        for i in 0..<r{
            for j in 0..<c{
                if(map[i][j] == -1){continue}

                map[i][j] += tempMap[i][j]
            }
        }
    
    
//
//    for i in 0..<r{
//        for j in 0..<c{
//            if(map[i][j] == -1){continue}
//
//            var newNum = 0
//            for m in diffusedMaps{
//                newNum += m[i][j]
//            }
//            map[i][j] = newNum
//        }
//    }
    
    
}

func blowWind(){
    var blowedMap = Array(repeating: Array(repeating: -2, count: c), count: r)
    
    for i in 0..<r{
        for j in 0..<c{
            //1.col이 0이면서 row가 0..<upper.row
            //2.row가 0이면서 col 이 1..<c
            //3.col이 c-1이면서 row 1..<=upper.row
            //4.row == upper.row 이면서 col 1..<c-1
            //5.col이 0이면서 row가 lower.row+1..<r
            //6.row가 r-1이면서 col이 1..<c-1
            //7. col이 c-1이면서 row가 lower.row...r-1
            //8. row가 lower.row 이면서 col이 1..<c
            var num = map[i][j]
            if(j==0 && 0..<upperCon.0 ~= i){//1
                blowedMap[i+1][j] = num
            }else if(i==0 && 1..<c ~= j){//2
                blowedMap[i][j-1] = num
            }else if(j == c-1 && 1...upperCon.0 ~= i){//3
                blowedMap[i-1][j] = num
            }else if(i == upperCon.0 && 1..<c-1 ~= j){//4
                blowedMap[i][j+1] = num
            }else if(j == 0 && lowerCon.0+1..<r ~= i){//5
                blowedMap[i-1][j] = num
            }else if(i == r-1 && 1...c-1 ~= j){//6
                blowedMap[i][j-1] = num
            }else if(j == c-1 && lowerCon.0 ..< r-1 ~= i){//7
                blowedMap[i+1][j] = num
            }else if(i == lowerCon.0 && 1..<c ~= j){//8
                blowedMap[i][j+1] = num
            }else{
                continue
            }
            
        }
    }
    
    for i in 0..<r{
        for j in 0..<c{
            if(blowedMap[i][j] != -2 && map[i][j] != -1){
                map[i][j] = blowedMap[i][j]
            }
        }
    }
    
    var row1 = upperCon.0
    var col1 = upperCon.1
    var row2 = lowerCon.0
    var col2 = lowerCon.1
    map[row1][col1+1] = 0
    map[row2][col2+1] = 0
    
}

findConditioner()

var time = 0

while(time<t){
    diffuse()
    blowWind()
    time += 1
}

var sum = 0

for i in 0..<r{
    for j in 0..<c{
        if(map[i][j] == -1){continue}
        sum += map[i][j]
    }
}
print(sum)



