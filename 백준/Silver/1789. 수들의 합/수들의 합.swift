//12ms,79805KB
import Foundation
if let input = readLine() {
    var S = Int(input)!
    var sum = 0
    var i = 0
    var result = 0
    
    while(S >= sum){
        i+=1
        sum+=i
        
    }
    result = i-1
  print(result)
}
