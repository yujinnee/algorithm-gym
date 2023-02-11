import Foundation

func solution(_ s:String) -> [Int] {
    var s = s
    var previousCount = s.count
    var removedZero = 0
    var count = 0

    while(s != "1"){
        s=s.replacingOccurrences(of:"0",with:"")
        removedZero += previousCount-s.count
        s = String(s.count,radix:2)
        previousCount = s.count
        count += 1
    }
    
    return [count,removedZero]
}