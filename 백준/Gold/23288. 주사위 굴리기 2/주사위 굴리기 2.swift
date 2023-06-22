var input = readLine()!.split(separator: " ").compactMap{ Int(String($0))! }
var n = input[0]
var m = input[1]
var totalRoll = input[2]
var map = [[Int]]()

for _ in 0..<n{
    map.append(readLine()!.split(separator: " ").compactMap{Int(String($0))!})
    
}

var now = (0,0)
var dice = [4,1,3,2,5,6]

var directions = [[0,1],[1,0],[0,-1],[-1,0]]//동남서북
var di = 0

var roll = 0

var score = 0

while(roll<totalRoll){
    
    var nextPos = (now.0+directions[di][0],now.1+directions[di][1])
    if(0..<n ~= nextPos.0 && 0..<m ~= nextPos.1){
        di += 0
    }else{
        di=(di+2)%4 //방향반대로
        nextPos = (now.0+directions[di][0],now.1+directions[di][1])
    }
    
    now = nextPos
    
    switch(di){
    case 0:
        dice = rollToEast(dice: dice)
    case 1:
        dice = rollToSouth(dice: dice)
    case 2:
        dice = rollToWest(dice: dice)
    case 3:
        dice = rollToNorth(dice: dice)
    default:
        dice = rollToEast(dice: dice)
    }
    
    
    var below = dice[5]
    var boardNum = map[now.0][now.1]

    var queue = [(Int,Int)]()
    queue.append(now)
    var count = 1
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    visited[now.0][now.1] = true
    while(queue.count>0){

        var nowNode = queue.removeFirst()
        
        for idx in 0..<4{
            var nr = nowNode.0 + directions[idx][0]
            var nc = nowNode.1 + directions[idx][1]
            if(0..<n ~= nr && 0..<m ~= nc && map[nr][nc] == boardNum && visited[nr][nc] == false){
                visited[nr][nc] = true
                count += 1
                queue.append((nr,nc))
            }else{
                continue
            }
        }
    }
    
    
    
    score += count*boardNum
    
    if(boardNum<below){
        di = (di+1)%4
    }else if(boardNum>below){
        di = (di+3)%4
    }else{
        di += 0
    }
    

    
    roll += 1
}


func rollToEast(dice: [Int])->[Int]{
    var new = [0,0,0,0,0,0]
    new[0] = dice[5]
    new[1] = dice[0]
    new[2] = dice[1]
    new[3] = dice[3]
    new[4] = dice[4]
    new[5] = dice[2]
    return new
}
func rollToWest(dice: [Int])->[Int]{
    var new = [0,0,0,0,0,0]
    new[0] = dice[1]
    new[1] = dice[2]
    new[2] = dice[5]
    new[3] = dice[3]
    new[4] = dice[4]
    new[5] = dice[0]
    return new
}
func rollToSouth(dice: [Int])->[Int]{
    var new = [0,0,0,0,0,0]
    new[0] = dice[0]
    new[1] = dice[3]
    new[2] = dice[2]
    new[3] = dice[5]
    new[4] = dice[1]
    new[5] = dice[4]
    return new
}
func rollToNorth(dice: [Int])->[Int]{
    var new = [0,0,0,0,0,0]
    new[0] = dice[0]
    new[1] = dice[4]
    new[2] = dice[2]
    new[3] = dice[1]
    new[4] = dice[5]
    new[5] = dice[3]
    return new
}

print(score)