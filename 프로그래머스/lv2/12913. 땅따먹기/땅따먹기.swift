import Foundation

var prev=0
var landBoard = [[Int]]()
var sum = 0
func solution(_ land:[[Int]]) -> Int{
     var answer = 0
    var land = land
    for i in 0..<(land.count-1) {
        land[i+1][0] += max(land[i][1], land[i][2], land[i][3])
        land[i+1][1] += max(land[i][0], land[i][2], land[i][3])
        land[i+1][2] += max(land[i][0], land[i][1], land[i][3])
        land[i+1][3] += max(land[i][0], land[i][1], land[i][2])
    }
 
    let last = land.last!
    return max(last[0],last[1], last[2], last[3])
}
