import Foundation

func solution(_ s:String) -> String {
    var string = s.split(separator: " ").map { Int(String($0))! }
    
    var min=string[0]
    var max=string[0]
    for i in 0..<string.count{
        if string[i]<min{
            min = string[i]
        }
        if string[i]>max{
            max = string[i]
        }
    }
    let answer = String(min) + " " + String(max)
    
    return answer
}
extension String{
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
}
