
import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var c = counter(weights)
    var answer = 0
    for (k,v) in c{
        if v>=2{
            answer += (v*(v-1))/2
        }
    }
    var weightsSet = Set<Double>()
    // for w in weights{
    //     weightsSet.insert(Double(w))
    // }
    for (k,v) in c{
        weightsSet.insert(Double(k))
    }

    
    for w in weightsSet{
        
        if weightsSet.contains(w*2.0/3.0){
            answer += c[Int(w)]!*c[Int(w*2.0/3.0)]!
        }
        if weightsSet.contains(w*2.0/4.0){
            answer += c[Int(w)]!*c[Int(w*2.0/4.0)]!
        }
        if weightsSet.contains(w*3.0/4.0){
            answer += c[Int(w)]!*c[Int(w*3.0/4.0)]!
        }
    }

    return Int64(answer)
}

func counter(_ seq: [Int]) -> [Int:Int] {
  return Dictionary( seq.map { ($0, 1) }, uniquingKeysWith: +)
}