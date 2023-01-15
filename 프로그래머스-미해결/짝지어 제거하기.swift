import Foundation

func solution(_ s:String) -> Int{
    //미해결 코드입니다.
    var answer:Int = -1
    var s = Array(s)
    
    
    while(true){
        var count = s.count
        if count == 0 {
            return 1
        }
        var beforeNum = s.count
        for i in 0..<count-1{
            if(s[i] == s[i+1]){
                s.remove(at: i+1)
                s.remove(at: i)
                break
                
            }
        }
        var afterNum = s.count
        if(beforeNum == afterNum){
            break
        }else{
            continue
        }
    }
    return 0
   
}
