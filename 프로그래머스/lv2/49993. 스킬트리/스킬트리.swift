import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    //스킬트리에서 선행스킬순서에 있는거만 가져오기 
    //ABCDEF
    // A,AB,ABC,ABCD,ABCDE,ABCDEF만 가능
    //맨처음이 A면 그다음거 보기 
    //그다음거 B인지보기 
    //그다음거가 B가 아니면 실패
    //맨처음이 A가 아니면 실패
    
    var count = 0 
    var set = Set<Character>()
    for c in skill{
        set.insert(c)
    }
    
    for s in skill_trees { 
        var remadeWord = ""
        var skillTree = Array(s)
        for i in 0..<s.count{
            if set.contains(skillTree[i]){
                remadeWord.append(skillTree[i])
            }
        }
        var targetWord = Array(remadeWord)
        var skillArray = Array(skill)
        for i in 0..<targetWord.count{
            if skillArray[i] != targetWord[i]{
                count -= 1
                break
            }
        }
        count += 1
        
    }
    
    return count
}