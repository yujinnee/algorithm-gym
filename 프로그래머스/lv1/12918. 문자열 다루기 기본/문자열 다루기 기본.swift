func solution(_ s:String) -> Bool {
    var s = Array(s)
    var answer = false
    if(s.count==4 || s.count==6){
        for c in s{
        if  !(c.asciiValue! >= 48 && c.asciiValue! <= 57){
            return false
        }
    }
        return true
    }
    
    return false
}