import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    let numCommands = commands.count
    var answerArray = [Int]()
    for i in 0..<numCommands{
        let firstIndex = commands[i][0]
        let lastIndex = commands[i][1]
        let orderNumber = commands[i][2]
        var subArray = [Int]()
        for j in (firstIndex-1)..<lastIndex{
            subArray.append(array[j])
        }
        subArray.sort()
        
        answerArray.append(subArray[orderNumber-1])
               
    }
  
            return answerArray
}