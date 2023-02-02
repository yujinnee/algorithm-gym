func solution(_ s:String) -> String {
    var s = Array(s)
    s.sort(by: {$0.asciiValue! > $1.asciiValue!})
   
    return String(s)
}