let input = readLine()!.split(separator : " " ).map{Int(String($0))!}
let row = input[0], col = input[1], T = input[2]
var array = Array(repeating: Array(repeating : 0, count : col ), count : row)
let direction = [(0,1),(1,0),(0,-1),(-1,0)]
var aircleaner = [(Int,Int)]()
for i in 0..<row {
    let input2 = readLine()!.split(separator : " " ).map{Int(String($0))!}
    for j in 0..<input2.count {
        array[i][j] = input2[j]
        if input2[j] == -1 {
            aircleaner.append((i,j))
        }
    }
}
for _ in 0..<T {
    diffuse()
    doAircleaner()
    
}
print(getAnswer())



func diffuse() {
    var temp = Array(repeating: Array(repeating:0,count : col ), count: row)
    for i in 0..<row {
        for j in 0..<col {
            if array[i][j] != 0 && array[i][j] != -1 {
                var diffuseSuccess = 0
                let diffuse = array[i][j] / 5
                for k in 0..<4 {
                    let next = (i+direction[k].0, j+direction[k].1)
                    if next.0 >= row || next.1 >= col || next.0 < 0 || next.1 < 0 { continue }
                    if array[next.0][next.1] != -1 {
                        temp[next.0][next.1] += diffuse
                        diffuseSuccess += 1
                    }
                }
                array[i][j] -= (diffuse * diffuseSuccess)
            }
        }
    }
    sum(temp)
}
func sum(_ temp : [[Int]] ) {
    for i in 0..<row {
        for j in 0..<col {
            if array[i][j] != -1 {
                array[i][j] += temp[i][j]
            }
        }
    }
    
    
}

func doAircleaner() {
    
    // 공기청정기 윗부분
    for i in (0..<aircleaner[0].0).reversed() {
        if i+1 == aircleaner[0].0 {
            array[i][0] = 0
        }else {
            array[i+1][0] = array[i][0]
        }
    }
    for i in (1..<col) {
        array[0][i-1] = array[0][i]
    }
    for i in (1...aircleaner[0].0) {
        array[i-1][col-1] = array[i][col-1]
        
    }
    for i in (1..<col-1).reversed() {
        
        array[aircleaner[0].0][i+1] = array[aircleaner[0].0][i]
        if i == 1 {
            array[aircleaner[0].0][i] = 0
        }
    }
    
    
    // 공기청정기 아랫부분
    for i in (aircleaner[1].0+1..<row) {
        if i-1 == aircleaner[1].0 {
            array[i][0] = 0
            
        }else {
            array[i-1][0] = array[i][0]
        }
    }
    
    for i in (1..<col) {
        array[row-1][i-1] = array[row-1][i]
    }
    
    for i in (aircleaner[1].0..<row-1).reversed() {
        array[i+1][col-1] = array[i][col-1]
    }
    
    for i in (1..<col-1).reversed() {
        
        array[aircleaner[1].0][i+1] = array[aircleaner[1].0][i]
        if i == 1 {
            array[aircleaner[1].0][i] = 0
        }
    }
    
    
}

func getAnswer() -> Int {
    var answer = 0
    for i in 0..<row {
        for j in 0..<col {
            if array[i][j] != -1 {
                answer += array[i][j]
            }
        }
    }
    return answer
}