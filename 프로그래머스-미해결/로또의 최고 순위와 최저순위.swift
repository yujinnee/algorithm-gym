import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    //미해결 코드입니다.
    var sameCount = 0
    var zeroCount = 0
    var worstRank = 0, bestRank = 0
    
    for num in lottos{
        if(num==0){
            zeroCount+=1 }
    }
    
    for i in 0..<lottos.count{
        for j in 0..<win_nums.count{
            if lottos[i] == win_nums[j]{
                sameCount += 1;
            }
    }
        
         enum sameCount {
                        case 6
                        case 5
                        case 4
                        case 3
                        case 2
                        case 1
                        case 0
                }

        //우선 맞춘 개수 기준으로 최저 순위 설정
        switch sameCount{
        case 6: worstRank = 1
        case 5: worstRank = 2
        case 4: worstRank = 3
        case 3: worstRank = 4
        case 2: worstRank = 5
        case 1: worstRank = 6
        case 0: worstRank = 6
        // default: worstRank = 6 //default 문은 어떻게 써주는게 베스트일까?
        }
        switch sameCount{
        case 6: worstRank = 1
        case 5: worstRank = 2
        case 4: worstRank = 3
        case 3: worstRank = 4
        case 2: worstRank = 5
        case 1: worstRank = 6
        case 0: worstRank = 6
        default: worstRank = 6 //default 문은 어떻게 써주는게 베스트일까?
        }
        
        bestRank = worstRank-zeroCount
        
         if(bestRank == 0){
             bestRank = 1
         }
    }
    
    
    return [bestRank,worstRank]
}
