import Foundation

func checkValidate(sentence: String) -> Bool {
    var sentence = Array(sentence)
    var stack = Array<Character>()
    for i in 0..<sentence.count {
        if(sentence[i]=="("){
            stack.append(sentence[i])
        }else if(sentence[i]==")"){
            if(stack.count == 0){
                return false
            }
            if(stack.popLast() == "("){
                continue
            }else{
                return false
            }
        }
    }
    if(stack.count>0){
        return false
    }
    return true
}


var num = Int(readLine()!)!
for _ in 0..<num {
    var sentence = readLine()!
    print(checkValidate(sentence: sentence) ? "YES" : "NO")
}