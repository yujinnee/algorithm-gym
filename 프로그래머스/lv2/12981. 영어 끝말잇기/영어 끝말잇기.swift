import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var wordSet = Set<String>()
    var previousWordsCount = 0
    var times = Array(repeating:0,count:n)
    
    var character = words[0].last
    wordSet.insert(words[0])
    times[0]=1
    
    for i in 1..<words.count{
        var personNum = i%n
       times[personNum] += 1
        wordSet.insert(words[i])

        if words[i].first != words[i-1].last{
            return [personNum+1,times[personNum]]
        }else if(previousWordsCount == wordSet.count){
                return [personNum+1,times[personNum]]
        }else{
                    previousWordsCount = wordSet.count
                }
        
    }
    return [0,0]
}