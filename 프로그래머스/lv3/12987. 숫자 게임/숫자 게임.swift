import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var sortedA = a.sorted()
    var sortedB = b.sorted()
    var score = 0
    var i = sortedA.count-1
    var j = sortedB.count-1
    while(true){
        if(i==(-1)){break}
        if(sortedB[j]>sortedA[i]){
            score += 1
            i-=1
            j-=1
        }else{
            i-=1
        }
    }
    
    return score
}