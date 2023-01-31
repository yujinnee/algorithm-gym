import Foundation

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    var s = Array(s.lowercased())
    var numP = 0 
    var numY = 0
    for char in s{
        if char == "p"{
            numP += 1
        }else if char == "y"{
            numY += 1
        }else{
            continue
        }
    }
    if numP == numY{
        return true
    }else{
        return false
    }
    
    
    
    return ans
}