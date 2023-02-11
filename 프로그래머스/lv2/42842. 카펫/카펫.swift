import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    if yellow == 1{
        return [3,3]
    }
    for i in 1...yellow{
        if yellow%i == 0 {
            if(2*(i+(yellow/i))+4) == brown{
                return [(yellow/i)+2,i+2]
            }
        }
    }
    
    return []
}