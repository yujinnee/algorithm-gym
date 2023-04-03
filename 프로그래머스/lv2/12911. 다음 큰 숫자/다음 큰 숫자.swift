import Foundation

func solution(_ n:Int) -> Int
{
    var count = String(n,radix:2).filter({ $0 == "1" }).count
    var next = n+1
    while(true){
        if( count == String(next,radix:2).filter({ $0 == "1" }).count){
            break
        }
        
        next+=1
    }
    
    return next
}