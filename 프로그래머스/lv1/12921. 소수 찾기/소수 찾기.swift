import Foundation
func solution(_ n:Int) -> Int {
    var num = [Bool](repeating: true, count: n+1) 
    for i in 2...Int(sqrt(Double(n))+1){
        var j = 2
        if(num[i]==true){
            while(i*j<=n){
            num[i*j]=false
            j=j+1
            }
        }else{
                continue
            }
        
    }

    var ans = 0 
    for i in 2..<num.count{
        if num[i] {
            ans += 1
        }
    }

    return ans
}