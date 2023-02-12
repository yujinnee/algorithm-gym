func solution(_ s:String, _ n:Int) -> String {
    var n = UInt8(n%26)
    
    var A = Character("A").asciiValue!
    var Z = Character("Z").asciiValue!
    var a = Character("a").asciiValue!
    var z = Character("z").asciiValue!
    var answer = ""
    for c in s{
        var x = c.asciiValue!
        var s = ""
        if (x>=A&&x<=Z){
            if(x+n<=Z){
                s = String(UnicodeScalar(x+n))
            }else{
                s = String(UnicodeScalar(A+(x+n-Z-1)))
            }
            answer.append(s)
        }else if(x>=a&&x<=z){
            if(x+n <= z){
                s = String(UnicodeScalar(x+n))
            }else{
                s = String(UnicodeScalar(a+(x+n-z-1)))
            }
            answer.append(s)
        }
        else if(c==" "){
            answer.append(" ")
        }
    }
    return answer
}

