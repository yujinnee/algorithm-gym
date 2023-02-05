import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    let n = N
    var db: [[Int]] = Array(repeating: Array(repeating: k+1, count: n+1), count: n+1)
    
    for singleRoad in road {
        if db[singleRoad[0]][singleRoad[1]] > singleRoad[2] {
            db[singleRoad[0]][singleRoad[1]] = singleRoad[2]
            db[singleRoad[1]][singleRoad[0]] = singleRoad[2]
        }
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                let time = (i == j) ? 0 : db[i][k] + db[k][j]
                if db[i][j] > time {
                    db[i][j] = time
                    db[j][i] = time
                }
            }
        }
    }
    
    return db[1].filter { $0 <= k }.count
}