import Foundation 

func solution(_ dartResult:String) -> Int {
    var dartResult = Array(dartResult)
    var prevprev = 0
    var prev = 0 
    var now = 0
    var num = ""
    var answer = 0
    for i in dartResult.indices{
        print(answer)
        if(dartResult[i] == "S"){
            now = Int(num)!
            answer += now
            prevprev = prev
            prev = now
            num = ""
        }else if(dartResult[i] == "D"){
           now = Int(pow(Double(num)!,2.0))
            answer += now
            prevprev = prev
            prev = now
            num = ""
        }else if(dartResult[i] == "T"){
            now = Int(pow(Double(num)!,3.0))
            answer += now
            prevprev = prev
            prev = now
            num = ""
        }else if(dartResult[i] == "*"){
            answer-=prev
            prev = prev*2
            answer += prev
            
            answer -= prevprev
            prevprev = prevprev*2
            answer += prevprev
            
            prevprev = prev
            
        }else if(dartResult[i] == "#"){
            answer -= prev
            prev = prev*(-1)
            answer += prev
            prevprev = prev
        }
        else{
            num.append(dartResult[i])
        }
    }
    print(answer)
    return answer
}