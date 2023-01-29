import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var requests = d.sorted()
    var spend = 0
    var answer = 0 
    for r in requests{
        if(spend+r<=budget){
            answer += 1
            spend = spend+r
        }else{
            break
        }
    }
    return answer
}