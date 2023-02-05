import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var categories = Set<String>()
    var answer = 1
    var myDictionary = Dictionary<String, Int>()
    for cloth in clothes{
        if !(categories.contains(cloth[1])) {//기존에 없던 카테고리면 새로 저장
            myDictionary[cloth[1]] = 1
            categories.insert(cloth[1])
        }else{
            myDictionary[cloth[1]] = myDictionary[cloth[1]]! + 1
        }
    }
    for (key,value) in myDictionary{
        answer *= value+1
    }
    
    answer = answer - 1
   

    return answer
}