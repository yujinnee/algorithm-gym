import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for i in operations {
        let command = i.split(separator: " ").map({String($0)})
        
        if command[0] == "I" { 
            queue.append(Int(command[1])!) 
        }else if command[0] == "D" && !queue.isEmpty {
            if command[1]=="-1" { 
                queue.sort(by: >)
                queue.removeLast() 
            }else { 
                queue.sort()
                queue.removeLast() }
        }
    }
    var answer = [0,0]
    if !(queue.isEmpty){
        answer = [queue.max()!, queue.min()!]
    }
    
    return answer
}