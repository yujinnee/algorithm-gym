import Foundation

func solution(_ s:String) -> [Int] {
var result = [Int]()
    var dic = [Int : Int]()
 let arr = s.components(separatedBy: ["{", "}", ","]).filter { !$0.isEmpty }.map { Int($0)! }
    
arr.forEach {
        dic.updateValue((dic[$0] ?? 0) + 1, forKey: $0)
    }
    
    
    dic.values.sorted(by: >).forEach {
        result.append(dic.someKey(forValue: $0)!)
    }
    
    return result

}

extension Dictionary where Value: Equatable {
    func someKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}