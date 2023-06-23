var map = [[(Int,Int)]]()

for _ in 0..<4{
    var line = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var tupleArray = [(Int,Int)]()
    for i in 0..<line.count-1{
        if(i%2==0){
            tupleArray.append((line[i],line[i+1]))
        }
        
    }
    map.append(tupleArray)
}

var directions = [(-1,0),(-1,-1),(0,-1),(1,-1),(1,0),(1,1),(0,1),(-1,1)]

var sharkPos = (0,0)
var sharkDirection = map[0][0].1
var initialScore = map[0][0].0

map[0][0].0 = 17

var maxScore = 0



func moveFish(inputmap:[[(Int,Int)]])->[[(Int,Int)]]{
    var map = inputmap
    for fishNum in 1...16{//1에서 16번 물고기 이동
       
        var now = (0,0)
        var direction = 0
        var isExist = false
        for i in 0..<4{//물고기 위치 찾기
            for j in 0..<4{
                if(map[i][j].0 == fishNum){
                    now = (i,j)
                    direction = map[i][j].1-1
                    isExist = true
                }
                
            }
        }
        if isExist == false{
            continue
        }
        
        
        var moved = false
        var count = 0
        while(moved == false){
            if(count == 8){//8방향아무도 못가면 그대로
                break
            }

            var next = (now.0+directions[direction].0,now.1+directions[direction].1)
            
            if(0..<4 ~= next.0 && 0..<4 ~= next.1 && (map[next.0][next.1].0 != 17)){
                moved = true
                var tmp = map[next.0][next.1]
                map[next.0][next.1] = map[now.0][now.1]
                map[now.0][now.1] = tmp
              
                map[next.0][next.1].1 = direction+1
                
            }else{
                direction = (direction+1)%8
                count += 1
                
            }
        }
        
    }
    
    return map
}


func moveShark(inputmap:[[(Int,Int)]],sharkPos: (Int,Int),sharkDirection:Int,prevscore: Int,depth: Int) {

    var candidatesPos = [(Int,Int)]()
    var fishedmap = moveFish(inputmap:inputmap)
  

    
    for i in 1...3{
        var map = fishedmap
        var sharkDirection = map[sharkPos.0][sharkPos.1].1-1//상어 방향

        var score = prevscore

      
      
        var nextPos = (sharkPos.0+i*directions[sharkDirection].0,sharkPos.1+i*directions[sharkDirection].1)//상어 위치
        if(0..<4~=nextPos.0 && 0..<4~=nextPos.1 && map[nextPos.0][nextPos.1].0 != -1 ){//경계안이고 물고기 있을 때
//            candidatesPos.append(nextPos)

            map[sharkPos.0][sharkPos.1].0 = -1 // 상어가 먹고 지나가니 물고기 없어서 -1
            score += map[nextPos.0][nextPos.1].0// 다음에 먹은 물고기 점수 더하기
            map[nextPos.0][nextPos.1].0 = 17 // 다음 갈곳에 상어있다고 17 저장
            sharkDirection = map[nextPos.0][nextPos.1].1// 다음 상어방향는 원래 있던 물고기 방향
         
            
            moveShark(inputmap: map,sharkPos: nextPos,sharkDirection: sharkDirection,prevscore: score,depth: depth+1)
            
        }
        if(score>maxScore){
            maxScore = score
        }
        

    }

    
}
moveShark(inputmap:map,sharkPos: sharkPos, sharkDirection: sharkDirection, prevscore: initialScore,depth: 1)
print(maxScore)

