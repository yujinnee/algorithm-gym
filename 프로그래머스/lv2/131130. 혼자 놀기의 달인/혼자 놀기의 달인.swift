import Foundation

func solution(_ cards:[Int]) -> Int {
    var isOpened = Array(repeating:false,count:cards.count)
    var tmpOpened = Array(repeating:false,count:cards.count)
    var max = 0
    var firstGroup = [Int]()
    var secondGroup = [Int]()
    
    
    for i in 0..<cards.count{ //i는 처음 고른 수, 첫번째 상자번호
        firstGroup = [Int]()
        var isOpened = Array(repeating:false,count:cards.count)
        var nextIdx = cards[i]-1
        isOpened[i] = true
        firstGroup.append(i)
        
        while(isOpened[nextIdx] == false){
            isOpened[nextIdx] = true
            firstGroup.append(cards[nextIdx])
            nextIdx = cards[nextIdx]-1
            
        }
        
        var tmpOpened = isOpened
        
        for j in 0..<cards.count{
            secondGroup = [Int]()
            var score = 0
            isOpened = tmpOpened
            if(isOpened[j] == true){continue}
            isOpened[j] = true
            secondGroup.append(j)

            var nextIdx = cards[j]-1
            while(isOpened[nextIdx] == false){
                isOpened[nextIdx] = true
                secondGroup.append(cards[nextIdx])
                nextIdx = cards[nextIdx]-1
                
            }
            score = firstGroup.count * secondGroup.count
            if(score>max){max = score}
        }
    }
    return max
}
