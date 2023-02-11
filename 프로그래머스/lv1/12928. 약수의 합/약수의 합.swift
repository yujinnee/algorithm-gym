import Foundation 

func solution(_ n:Int) -> Int {
    var answer = 1
    if n==0{
        return 0
    }else if n==1{
        return 1
    }
    for i in 2...n{
       answer += n%i == 0 ? i : 0 
    }
    return answer
}