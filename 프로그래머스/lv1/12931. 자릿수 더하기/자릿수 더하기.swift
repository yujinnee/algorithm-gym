import Foundation

func solution(_ n:Int) -> Int
{
    var n = n
    var answer:Int = 0
    while(n/10 > 0){
        answer += n%10
        n=n/10
        
    }
    answer += n
  
    
    return answer
}