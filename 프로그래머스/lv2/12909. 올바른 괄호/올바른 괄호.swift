import Foundation

func solution(_ s:String) -> Bool
{
    var stack = Array<String>()
    for c in s{
        if (c=="("){
            stack.append("(")
        }else{//)
            var left = stack.popLast()
            if(left != "("){
                return false
            }
        }
    }
    if(stack.count != 0){
        return false
    }
    return true
}