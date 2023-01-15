import Foundation
//미해결 코드입니다.
func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var answer = n - lost.count
    var reserve = reserve
    for i in 0 ..< lost.count{
        for j in 0 ..< reserve.count{
            if reserve[j] == lost[i]-1{
                answer = answer + 1
                reserve.remove(at: j)
                break
            }else if reserve[j] == lost[i] + 1{
                answer = answer + 1
                reserve.remove(at: j)
                break
            }
        }
    }
    return answer
}
