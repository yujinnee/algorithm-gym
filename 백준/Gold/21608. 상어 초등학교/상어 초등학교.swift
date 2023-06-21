var n = Int(readLine()!)!
var sNum = n*n

var map = Array(repeating: Array(repeating: 0, count: n), count: n)


var data = Array(repeating: [Int]() , count: sNum)

for _ in 0..<sNum{
    var input = readLine()!.split(separator: " ").compactMap{Int(String($0))!}
    var target = input[0]
    var favoriteList = Array(input[1...4])
    data[target-1].append(contentsOf:favoriteList)
    var firstFiltered = getFirstCon(favoriteList: favoriteList)
    
    var targetSeat = (0,0)
    if(firstFiltered.count>1){
        var secondFiltered = getSecondCon(seats: firstFiltered)
        if(secondFiltered.count > 1){
            var thirdFiltered = getThirdCon(seats: secondFiltered)
            targetSeat = thirdFiltered
        }else{
            targetSeat = secondFiltered.first!
        }
    }else{
        targetSeat = firstFiltered.first!
    }
    map[targetSeat.0][targetSeat.1] = target
    
}


func getFirstCon(favoriteList: [Int])->[(Int,Int)]{//첫번째 조건 만족하는 자리들
    var dr = [0,0,1,-1]
    var dc = [1,-1,0,0]
    
    var candidates = [(Int,Int)]()
    var maxCount = 0
    for i in 0..<n{
        for j in 0..<n{//빈자리 하나씩 보면서 확인
            var now = (i,j)//앉을지 말지 후보자리
            var favCount = 0//좋아하는 친구 숫자
            
            if map[i][j]>0{continue}//빈자리 아니면 패스
            
            for idx in 0..<4{//네가지 방향 좋아하는 친구 몇명있는지 확인
                //                var nr = i + dr[idx]
                //                var nc = j + dc[idx]
                //                var neighbor = (nr,nc)
                var neighbor = (i+dr[idx],j+dc[idx])//이웃 인덱스
                if( 0..<n ~= neighbor.0 && 0..<n ~= neighbor.1){//이웃인덱스 아웃 파악
                    
                    if(favoriteList.contains(map[neighbor.0][neighbor.1])){
                        favCount += 1
                    }
                    
                }
                
            }
            
            if(favCount>maxCount){
                maxCount=favCount
                candidates = [(Int,Int)]()
                candidates.append((i,j))
            }else if(favCount == maxCount){
                candidates.append((i,j))
            }else{
                continue
            }
            
        }
    }
    
    return (candidates)
    
}




func getSecondCon(seats: [(Int,Int)])->[(Int,Int)]{
    var dr = [0,0,1,-1]
    var dc = [1,-1,0,0]
    
    var maxEmptyCount = 0
    var candidates = [(Int,Int)]()
    
    for s in seats{
        var emptyCount = 0
        for idx in 0..<4{//네가지 방향 좋아하는 친구 몇명있는지 확인
            
            var neighbor = (s.0+dr[idx],s.1+dc[idx])//이웃 인덱스
            if( 0..<n ~= neighbor.0 && 0..<n ~= neighbor.1){//이웃인덱스 아웃 파악
                
                if(map[neighbor.0][neighbor.1]==0){
                    emptyCount += 1
                }
                
            }
            
        }
        if(emptyCount>maxEmptyCount){
            maxEmptyCount = emptyCount
            candidates = [(Int,Int)]()
            candidates.append(s)
        }else if(emptyCount==maxEmptyCount){
            candidates.append(s)
        }else{
            continue
        }
    }
    
    return candidates
    
}

func getThirdCon(seats: [(Int,Int)])->(Int,Int){
    var sortedSeats = seats.sorted(by: {$0.0<$1.0 || $0.1<$1.1})
    return seats.first!
}


func getScore()->Int{
    var dr = [0,0,1,-1]
    var dc = [1,-1,0,0]
    var score = 0//만족도
    for i in 0..<n{
        for j in 0..<n{
            var friendCount = 0
            for idx in 0..<4{//네가지 방향 좋아하는 친구 몇명있는지 확인
                var now = map[i][j]
                var favoriteList = data[now-1]
                var neighbor = (i+dr[idx],j+dc[idx])//이웃 인덱스
                if( 0..<n ~= neighbor.0 && 0..<n ~= neighbor.1){//이웃인덱스 아웃 파악
                    //                    print(favoriteList)
                    //                    print(map[neighbor.0][neighbor.1])
                    
                    if( favoriteList.contains(map[neighbor.0][neighbor.1]) ){
                        friendCount += 1
                    }
                    
                }
                
            }
            
            switch(friendCount){
            case 0: score += 0
            case 1: score += 1
            case 2: score += 10
            case 3: score += 100
            case 4: score += 1000
            default: score += 0
                
            }
        }
    }
    
    return score
}

print(getScore())
