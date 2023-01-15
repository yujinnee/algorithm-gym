import Foundation

func solution(_ answers:[Int]) -> [Int] {
    var scoreOne = 0
    var scoreTwo = 0
    var scoreThree = 0
    
    for i in answers.indices{
        
        if answers[i] == i%5 + 1{
            scoreOne += 1
        }
        
        var order = i%8
        switch order {
        case 0,2,4,6 :
            if answers[i] == 2{
                scoreTwo += 1
            }
            
        case 1,3 :
            if answers[i] == order {
                scoreTwo += 1
            }
        case 5 :
            if answers[i] == 4 {
                scoreTwo += 1
            }
        case 7 :
            if answers[i] == 5 {
                scoreTwo += 1
            }
        default :
            break
        }
        
        order = i%10
        switch order{
        case 0,1 :
            if answers[i] == 3{
                scoreThree += 1
            }
            
        case 2,3 :
            if answers[i] == 1 {
                scoreThree += 1
            }
        case 4,5 :
            if answers[i] == 2 {
                scoreThree += 1
            }
        case 6,7 :
            if answers[i] == 4 {
                scoreThree += 1
            }
        case 8,9 :
            if answers[i] == 5 {
                scoreThree += 1
            }
        default :
            break
        }
        
        
    }

    var answerArray = [Int]()
    
    var maxNumber = max(scoreOne, scoreTwo, scoreThree)
    if(maxNumber == scoreOne){
        answerArray.append(1)
    }
    if(maxNumber == scoreTwo){
        answerArray.append(2)
    }
    if(maxNumber == scoreThree){
        answerArray.append(3)
    }
    return answerArray
}